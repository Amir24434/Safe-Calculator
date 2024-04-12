import 'package:calculator/controller/task_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddTaskScreen extends StatelessWidget {
  AddTaskScreen({super.key});

  final TaskController controller = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    TextTheme text = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: Text(
          "Add note",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.03,
          ),
          child: Column(
            children: [
              const Spacer(
                flex: 2,
              ),
              Text(
                "Add new note",
                style: text.headlineSmall,
              ),
              const Spacer(
                flex: 1,
              ),
              TextField(
                controller: controller.textEditingController,
                keyboardType: TextInputType.number,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: size.height * 0.03,
                ),
                decoration: InputDecoration(
                  fillColor: Colors.grey[300],
                  filled: true,
                  hintText: "Enter note",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              InkWell(
                onTap: () {
                  if (controller.textEditingController!.text.isNotEmpty) {
                    controller.addTask();
                  } else if (controller.textEditingController!.text.isEmpty) {
                    Get.snackbar(
                      "No note added",
                      "Add note",
                      snackPosition: SnackPosition.TOP,
                    );
                  }
                  Navigator.pop(context);
                },
                child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: size.height * 0.05,
                  decoration: BoxDecoration(
                    color: Colors.blue[900],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(
                      "Add note",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: size.height * 0.025,
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer(
                flex: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
