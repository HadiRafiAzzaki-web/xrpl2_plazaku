import 'package:flutter/material.dart';
import 'package:xrpl2_plazaku/services/admin_setting_service.dart';

class AdminSetting extends StatefulWidget {
  const AdminSetting({super.key});

  @override
  State<AdminSetting> createState() => _AdminSettingState();
}

class _AdminSettingState extends State<AdminSetting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: set.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(set[index].text),
          leading: Icon(set[index].icon),
          trailing: Icon(Icons.arrow_forward_ios_outlined),
        ),
      ),
    );
  }
}
