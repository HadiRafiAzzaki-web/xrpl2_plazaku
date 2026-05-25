import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  final String image;

  const ProductImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    if (image.startsWith('assets/')) {
      return Image.asset(image, fit: BoxFit.cover);
    }

    if (image.isNotEmpty && !kIsWeb) {
      return Image.file(File(image), fit: BoxFit.cover);
    }

    return Image.asset('assets/images/no-image.png', fit: BoxFit.cover);
  }
}
