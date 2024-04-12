import 'package:calculator/provider/cal_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Buttons extends StatelessWidget {
  const Buttons({
    super.key,
    required this.label,
    required this.color,
  });

  final String label;
  final Color color;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () => Provider.of<CalculatorProvider>(context, listen: false)
          .setValue(label),
      child: Container(
        height: size.height * 0.1,
        width: size.width * 0.2,
        decoration: BoxDecoration(
          color: const Color(0xFF26282D),
          borderRadius: BorderRadius.circular(50.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                fontSize: size.height * 0.03,
                color: color,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
