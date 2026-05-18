import 'package:flutter/material.dart';
import 'package:xrpl2_plazaku/models/order_model.dart';
import 'package:xrpl2_plazaku/utils/display_status.dart';

class TabItemNav extends StatelessWidget {
  final VoidCallback onTap;
  final ProductStatus label;
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
        margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          color: Color(0xFFF5F5F5),
          border: isActive
              ? Border(bottom: BorderSide(color: Colors.blue, width: 3))
              : null,
        ),
        child: Text(
          label.displayName,
          style: TextStyle(
            fontSize: 18,
            color: isActive ? Colors.blue : Colors.grey,
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
