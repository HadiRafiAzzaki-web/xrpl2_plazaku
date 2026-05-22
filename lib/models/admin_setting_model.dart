import 'package:flutter/material.dart';

class AdminSettingModel {
  final String text;
  final Color color;
  final IconData icon;
  final VoidCallback? onTap;
  final Widget page;

  AdminSettingModel({
    this.onTap,
    required this.text,
    required this.color,
    required this.icon,
    required this.page,
  });
}
