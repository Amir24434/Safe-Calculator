import 'package:calculator/widgets/button.dart';
import 'package:calculator/provider/cal_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer<CalculatorProvider>(
      builder: (context, provider, _) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue[900],
            automaticallyImplyLeading: true,
            centerTitle: true,
            title: Text(
              "Calculator",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          backgroundColor: Colors.black,
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: size.height * 0.02,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                  child: TextField(
                    controller: provider.compController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      filled: true, // Enable filling background color
                      fillColor: Color.fromARGB(255, 62, 63, 65),
                    ),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: size.height * 0.05,
                    ),
                    readOnly: true,
                    showCursor: true,
                    autofocus: true,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Color(0xFF212224),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        )),
                    height: size.height * 0.58,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.03,
                        vertical: size.height * 0.015,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:
                                List.generate(4, (index) => buttons[index + 0]),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:
                                List.generate(4, (index) => buttons[index + 4]),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:
                                List.generate(4, (index) => buttons[index + 8]),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: List.generate(
                                          3, (index) => buttons[index + 12]),
                                    ),
                                    SizedBox(
                                      height: size.width * 0.03,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: List.generate(
                                          3, (index) => buttons[index + 16]),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: size.width * 0.08,
                              ),
                              InkWell(
                                onTap: () => Provider.of<CalculatorProvider>(
                                        context,
                                        listen: false)
                                    .setValue("="),
                                child: Container(
                                  height: size.height * 0.2,
                                  width: size.width * 0.15,
                                  decoration: BoxDecoration(
                                    color: Colors.blue[900],
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Center(
                                      child: Text(
                                        "=",
                                        style: TextStyle(
                                          fontSize: size.height * 0.03,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
