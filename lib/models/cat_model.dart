import 'package:flutter/material.dart';

class CatModel {
  final String text;
  final Color color;
  final IconData icon;
  final VoidCallback? onTap;
  final Widget page;

  CatModel({
    this.onTap,
    required this.text,
    required this.color,
    required this.icon,
    required this.page,
  });
}
