import 'package:flutter/material.dart';

class AdminSetting extends StatefulWidget {
  const AdminSetting({super.key});

  @override
  State<AdminSetting> createState() => _AdminSettingState();
}

class _AdminSettingState extends State<AdminSetting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text("setting", style: TextStyle(color: Colors.white))],
      ),
      flexibleSpace: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple,Colors.purple,Colors.purpleAccent,Colors.purple,Colors.deepPurple],
          ),
        ),
      ),
    ),
      body: Positioned(child: Column(children: [],)),
    );
  }
}

