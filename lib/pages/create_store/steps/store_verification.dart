import 'dart:io';

import 'package:flutter/material.dart';

class StoreVerification extends StatefulWidget {
  const StoreVerification({super.key});

  @override
  State<StoreVerification> createState() => _StoreVerificationState();
}

class _StoreVerificationState extends State<StoreVerification> {
  File? idCardImage;
  File? selfPhotoImage;
  File? tinImage;

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
              'Store Verification',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 30),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.grey),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: Icon(Icons.credit_card),
                    title: Text('ID Card / Identity Card'),
                    trailing: Text('Not uploaded yet'),
                  ),
                  Divider(color: Colors.grey),
                  ListTile(
                    leading: Icon(Icons.credit_card),
                    title: Text('Self Photo'),
                    trailing: Text('Not uploaded yet'),
                  ),
                  Divider(color: Colors.grey),
                  ListTile(
                    leading: Icon(Icons.credit_card),
                    title: Text('Taxpayer Identification Number'),
                    trailing: Text('Not uploaded yet'),
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
