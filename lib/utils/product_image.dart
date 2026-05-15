import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:xrpl2_plazaku/models/product_model.dart';

class ProductImage extends StatelessWidget {
  final ProductModel product;
  final double height;
  final double width;

  const ProductImage({
    super.key,
    required this.product,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(width: width, height: height, decoration: BoxDecoration());
  }
}

Widget buildProductImage(
  ProductModel product, {
  double heightSize = 100,
  double widthSize = 100,
}) {
  //check if image uses bytes (for web/newly added products)
  if (product.webImage != null) {
    return Image.memory(
      product.webImage!,
      height: heightSize,
      width: widthSize,
      fit: BoxFit.cover,
    );
  }

  //check if image is from assets (default products)
  if (product.image.startsWith('assets/')) {
    return Image.asset(
      product.image,
      height: heightSize,
      width: widthSize,
      fit: BoxFit.cover,
    );
  }

  // 3. Check if image is from mobile file system
  if (product.image.isNotEmpty && !kIsWeb) {
    return Image.file(
      File(product.image),
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
