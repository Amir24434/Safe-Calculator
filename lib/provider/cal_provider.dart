import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart'; // Add this import

class CalculatorProvider extends ChangeNotifier {
  final compController = TextEditingController();

  void setValue(String value) {
    String str = compController.text;

    switch (value) {
      case "C":
        compController.clear();
        break;
      case "<":
        if (compController.text.isNotEmpty) {
          compController.text = str.substring(0, str.length - 1);
          break;
        } else {
          break;
        }

      case "X":
        compController.text += "*";
        break;
      case "=":
        compute();
        break;
      default:
        compController.text += value;
    }

    compController.selection = TextSelection.fromPosition(
        TextPosition(offset: compController.text.length));
  }

  void compute() {
    String text = compController.text;
    Parser p = Parser();
    Expression exp = p.parse(text);
    ContextModel cm = ContextModel();
    double result = exp.evaluate(EvaluationType.REAL, cm);
    compController.text = result.toString();
  }

  @override
  void dispose() {
    super.dispose();
    compController.dispose();
  }
}
