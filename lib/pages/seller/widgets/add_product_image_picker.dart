import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AddProductImagePicker extends StatelessWidget {
  final File? imageFile;
  final Uint8List? webImage;
  final VoidCallback onTap;

  const AddProductImagePicker({
    super.key,
    this.imageFile,
    this.webImage,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Product Photo', style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        GestureDetector(
          onTap: onTap,
          child: Container(
            height: 180,
            width: double.infinity,
            decoration: BoxDecoration(color: Color(0xFFD9E8FF)),
            child: _buildImage(),
          ),
        ),
      ],
    );
  }

  Widget _buildImage() {
    if (kIsWeb && webImage != null) {
      return Image.memory(webImage!, fit: BoxFit.cover);
    } else if (!kIsWeb && imageFile != null) {
      return Image.file(imageFile!, fit: BoxFit.cover);
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.add, size: 40),
          SizedBox(height: 10),
          Text('Add Photo', style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      );
    }
  }
}
