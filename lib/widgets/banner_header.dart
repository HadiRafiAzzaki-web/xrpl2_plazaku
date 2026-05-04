import 'package:flutter/material.dart';

class BannerHeader extends StatefulWidget {
  final String imageUrl;

  const BannerHeader({super.key, required this.imageUrl});

  @override
  State<BannerHeader> createState() => _BannerHeaderState();
}

class _BannerHeaderState extends State<BannerHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(widget.imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
