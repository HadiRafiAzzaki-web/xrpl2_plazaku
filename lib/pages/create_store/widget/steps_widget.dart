import 'package:flutter/material.dart';

class StepsWidget extends StatelessWidget {
  final int steps;
  final Color textColor;
  final Color containerColor;
  final Color borderColor;

  const StepsWidget({
    super.key,
    required this.steps,
    required this.textColor,
    required this.containerColor,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(40),
        border: Border.all(color: borderColor),
      ),
      child: Center(
        child: Text('$steps', style: TextStyle(color: textColor)),
      ),
    );
  }
}
