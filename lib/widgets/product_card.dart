import 'package:flutter/material.dart';
import 'package:xrpl2_plazaku/models/product_model.dart';
import 'package:xrpl2_plazaku/utils/product_image.dart';

import '../utils/price_format.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  final VoidCallback? onTap;

  const ProductCard({super.key, required this.product, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              child: SizedBox(
                height: 100,
                width: double.infinity,
                child: ProductImage(image: product.image),
              ),
            ),
            SizedBox(height: 6),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Text(product.title),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Text(formatRupiah(product.price)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Row(
                children: [
                  Icon(Icons.star, size: 18, color: Colors.orange),
                  Text("${product.rating} (${product.review})"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
