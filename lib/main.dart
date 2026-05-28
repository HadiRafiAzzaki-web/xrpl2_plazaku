import 'package:flutter/material.dart';
import 'package:xrpl2_plazaku/pages/splash_screen.dart';
import 'package:xrpl2_plazaku/services/app_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: appService,
      builder: (context, child) =>
          MaterialApp(home: SplashScreen(), debugShowCheckedModeBanner: false),
    );
  }
}
