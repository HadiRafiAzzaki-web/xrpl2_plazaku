import 'package:flutter/material.dart';

class TabItemNav extends StatelessWidget {
  final VoidCallback onTap;
  final String label;
  final bool isActive;

  const TabItemNav({
    super.key,
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(right: 20),
        padding: EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          color: Color(0xFFF5F5F5),
          border: isActive
              ? Border(bottom: BorderSide(color: Colors.blue))
              : null,
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isActive ? Colors.blue : Colors.grey,
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
