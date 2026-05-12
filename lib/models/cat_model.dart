import 'package:flutter/material.dart';

class CatModel {
  final String text;
  final Color color;
  final IconData icon;
  final Widget page;

  CatModel({
    required this.text,
    required this.color,
    required this.icon,
    required this.page,
  });
}