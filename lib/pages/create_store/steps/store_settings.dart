import 'package:flutter/material.dart';

import '../widget/create_store_input_widget.dart';
import '../widget/dropdown_button_widget.dart';

class StoreSettings extends StatefulWidget {
  const StoreSettings({super.key});

  @override
  State<StoreSettings> createState() => _StoreSettingsState();
}

class _StoreSettingsState extends State<StoreSettings> {
  final shopUsername = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Store Settings',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 30),
            CreateStoreInputWidget(
              controller: shopUsername,
              hint: 'Enter shop username',
              title: 'Shop Username',
            ),
            SizedBox(height: 20),
            DropdownButtonWidget(title: 'Delivery Method'),
            SizedBox(height: 20),
            DropdownButtonWidget(title: 'Payment Method'),
          ],
        ),
      ),
    );
  }
}
