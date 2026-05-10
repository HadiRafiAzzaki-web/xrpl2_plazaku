import 'package:flutter/material.dart';
import 'package:xrpl2_plazaku/models/product_model.dart';
import 'package:xrpl2_plazaku/utils/product_image.dart';

import '../utils/price_format.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final ProductModel imageUrl;
  final int price;
  final double rating;
  final int review;
  final VoidCallback? onTap;

  const ProductCard({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.price,
    required this.rating,
    required this.review,
    this.onTap,
  });

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
              child: buildProductImage(
                imageUrl,
                widthSize: double.infinity,
                heightSize: 100,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, maxLines: 2, overflow: TextOverflow.ellipsis),
                  Text(formatRupiah(price)),
                  Row(
                    children: [
                      Icon(Icons.star, size: 14, color: Colors.orange),
                      Text("$rating ($review)"),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
