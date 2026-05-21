import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  final String image;
  final double heightSize;
  final double widthSize;

  const ProductImage({
    super.key,
    required this.image,
    required this.heightSize,
    required this.widthSize,
  });

  @override
  Widget build(BuildContext context) {
    if (image.startsWith('assets/')) {
      return Image.asset(
        image,
        height: heightSize,
        width: widthSize,
        fit: BoxFit.cover,
      );
    }

    if (image.isNotEmpty && !kIsWeb) {
      return Image.file(
        File(image),
        height: heightSize,
        width: widthSize,
        fit: BoxFit.cover,
      );
    }

    return Image.asset(
      'assets/images/no-image.png',
      height: heightSize,
      width: widthSize,
      fit: BoxFit.cover,
    );
  }
}
