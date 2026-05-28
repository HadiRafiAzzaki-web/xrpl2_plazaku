import 'dart:io';

import 'package:flutter/material.dart';

class PickImage extends StatelessWidget {
  final VoidCallback onTap;
  final File? image;

  const PickImage({super.key, required this.onTap, this.image});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 180,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xFFD9E8FF),
          image: image != null
              ? DecorationImage(image: FileImage(image!), fit: BoxFit.cover)
              : null,
        ),
        child: image == null
            ? Column(
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
              )
            : Align(
                alignment: Alignment.topRight,
                child: Container(
                  margin: const EdgeInsets.all(8),
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: const Icon(Icons.edit, color: Colors.white, size: 18),
                ),
              ),
      ),
    );
  }
}
