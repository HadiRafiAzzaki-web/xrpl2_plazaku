import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../models/create_store_model.dart';

class StoreVerification extends StatefulWidget {
  final CreateStoreModel storeData;

  const StoreVerification({super.key, required this.storeData});

  @override
  State<StoreVerification> createState() => _StoreVerificationState();
}

class _StoreVerificationState extends State<StoreVerification> {
  File? idCardImage;
  File? selfPhotoImage;
  File? tinImage;

  @override
  void initState() {
    super.initState();
    idCardImage = widget.storeData.idCard;
    selfPhotoImage = widget.storeData.selfie;
    tinImage = widget.storeData.tin;
  }

  void pickImageIdCard() async {
    ImagePicker imagePicker = ImagePicker();

    final XFile? image = await imagePicker.pickImage(
      source: ImageSource.gallery,
    );

    if (image != null) {
      setState(() {
        idCardImage = File(image.path);
        widget.storeData.idCard = idCardImage;
      });
    }
  }

  void pickImageSelfPhoto() async {
    ImagePicker imagePicker = ImagePicker();

    final XFile? image = await imagePicker.pickImage(
      source: ImageSource.gallery,
    );

    if (image != null) {
      setState(() {
        selfPhotoImage = File(image.path);
        widget.storeData.selfie = selfPhotoImage;
      });
    }
  }

  void pickImageTIN() async {
    ImagePicker imagePicker = ImagePicker();

    final XFile? image = await imagePicker.pickImage(
      source: ImageSource.gallery,
    );

    if (image != null) {
      setState(() {
        tinImage = File(image.path);
        widget.storeData.tin = tinImage;
      });
    }
  }

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
                    trailing: Text(
                      idCardImage == null ? 'Not uploaded yet' : 'Uploaded',
                    ),
                    onTap: pickImageIdCard,
                  ),
                  Divider(color: Colors.grey),
                  ListTile(
                    leading: Icon(Icons.credit_card),
                    title: Text('Self Photo'),
                    trailing: Text(
                      selfPhotoImage == null ? 'Not uploaded yet' : 'Uploaded',
                    ),
                    onTap: pickImageSelfPhoto,
                  ),
                  Divider(color: Colors.grey),
                  ListTile(
                    leading: Icon(Icons.credit_card),
                    title: Text('Taxpayer Identification Number'),
                    trailing: Text(
                      tinImage == null ? 'Not uploaded yet' : 'Uploaded',
                    ),
                    onTap: pickImageTIN,
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
