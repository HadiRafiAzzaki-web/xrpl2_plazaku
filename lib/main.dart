import 'package:flutter/material.dart';
import 'package:xrpl2_plazaku/pages/admin/admin_dashboard_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: AdminDashboardPage(), debugShowCheckedModeBanner: false);
  }
}
