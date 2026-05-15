import 'package:flutter/material.dart';

class OrderStatus extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color color;

  const OrderStatus({
    super.key,
    required this.title,
    required this.subtitle,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SizedBox(height: 4),
          Text(subtitle, style: TextStyle(color: Colors.black54, fontSize: 13)),
        ],
      ),
    );
  }
}
