import 'package:calculator/controller/task_controller.dart';
import 'package:calculator/screens/add_task_screen.dart';
import 'package:calculator/widgets/task_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ToDoScreen extends StatelessWidget {
  ToDoScreen({super.key});

  final TaskController controller = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    TextTheme text = Theme.of(context).textTheme;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Notes",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue[900],
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddTaskScreen()));
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: SafeArea(
        child: Obx(
          () => (controller.tasklist.isEmpty)
              ? const Center(
                  child: Text(
                    "No Notes found",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                )
              : Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: size.height * 0.015,
                  ),
                  child: ListView.builder(
                    itemCount: controller.tasklist.length,
                    itemBuilder: ((context, index) => TaskTile(
                          size: size,
                          text: text,
                          time: controller.tasklist[index].taskCreated,
                          des: controller.tasklist[index].task,
                          onPressed: () {
                            controller.deleteTask(controller.tasklist[index]);
                          },
                        )),
                  ),
                ),
        ),
      ),
    );
  }
}
