import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
    required this.size,
    required this.text,
    this.time,
    this.des,
    this.onPressed,
  });

  final Size size;
  final TextTheme text;

  final String? time, des;
  final Callback? onPressed;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Material(
        elevation: 3,
        child: Container(
          height: size.height * 0.09,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text("$des",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: size.height * 0.03,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text("Date: $time",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: size.height * 0.015,
                            )),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: onPressed,
                child: Container(
                  alignment: Alignment.center,
                  width: size.width * 0.1,
                  height: double.maxFinite,
                  color: Colors.blue[900],
                  child: const Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
