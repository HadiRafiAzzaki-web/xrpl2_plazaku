import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Color textColor;
  final Color color;
  final String title;
  final double height;
  final double width;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.title,
    required this.onPressed,
    required this.color,
    required this.textColor,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        ),
        onPressed: onPressed,
        child: Text(title, style: TextStyle(color: textColor, fontSize: 18)),
      ),
    );
  }
}
