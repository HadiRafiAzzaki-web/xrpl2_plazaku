import 'package:flutter/material.dart';

class DropdownButtonWidget extends StatelessWidget {
  final String title;

  const DropdownButtonWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        SizedBox(height: 15),
        DropdownButtonFormField(
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
          ),
          items: [],
          onChanged: (value) {},
        ),
      ],
    );
  }
}
