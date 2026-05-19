import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:xrpl2_plazaku/pages/create_store/widget/create_store_input_widget.dart';
import 'package:xrpl2_plazaku/pages/create_store/widget/dropdown_button_widget.dart';

import '../widget/shop_image_widget.dart';

class StoreInformation extends StatefulWidget {
  const StoreInformation({super.key});

  @override
  State<StoreInformation> createState() => _StoreInformationState();
}

class _StoreInformationState extends State<StoreInformation> {
  final shopNameC = TextEditingController();
  final shopCategory = TextEditingController();
  final shopDescription = TextEditingController();
  final shopAddress = TextEditingController();
  final shopPhoneNum = TextEditingController();
  final shopEmail = TextEditingController();

  File? shopImage;

  void pickImage() async {
    ImagePicker imagePicker = ImagePicker();

    final XFile? image = await imagePicker.pickImage(
      source: ImageSource.gallery,
    );

    if (image != null) {
      setState(() {
        shopImage = File(image.path);
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
              'Store Information',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 30),
            PickImage(onTap: pickImage),
            SizedBox(height: 20),
            CreateStoreInputWidget(
              controller: shopNameC,
              hint: 'Enter shop name',
              title: 'Shop Name',
            ),
            SizedBox(height: 20),
            DropdownButtonWidget(title: 'Shop Category'),
            SizedBox(height: 20),
            CreateStoreInputWidget(
              controller: shopDescription,
              hint: 'Enter shop description',
              title: 'Shop Description',
            ),
            SizedBox(height: 20),
            CreateStoreInputWidget(
              controller: shopAddress,
              hint: 'Enter shop address',
              title: 'Shop address',
            ),
            SizedBox(height: 20),
            CreateStoreInputWidget(
              controller: shopPhoneNum,
              hint: 'Enter shop phone number',
              title: 'Shop phone number',
            ),
            SizedBox(height: 20),
            CreateStoreInputWidget(
              controller: shopEmail,
              hint: 'Enter shop phone number',
              title: 'Shop email',
            ),
          ],
        ),
      ),
    );
  }
}
