import 'package:flutter/material.dart';

class PickImage extends StatelessWidget {
  final VoidCallback onTap;

  const PickImage({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 180,
        width: double.infinity,
        decoration: BoxDecoration(color: Color(0xFFD9E8FF)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.store_mall_directory, size: 40),
            SizedBox(height: 10),
            Text(
              'Add Shop Photo',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
