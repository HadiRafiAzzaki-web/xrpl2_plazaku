import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:xrpl2_plazaku/models/create_store_model.dart';
import 'package:xrpl2_plazaku/pages/create_store/widget/create_store_input_widget.dart';
import 'package:xrpl2_plazaku/pages/create_store/widget/dropdown_button_widget.dart';

import '../../../models/product_model.dart';
import '../widget/shop_image_widget.dart';

class StoreInformation extends StatefulWidget {
  final CreateStoreModel storeData;

  const StoreInformation({super.key, required this.storeData});

  @override
  State<StoreInformation> createState() => _StoreInformationState();
}

class _StoreInformationState extends State<StoreInformation> {
  final _key = GlobalKey<FormState>();
  late var shopNameC = TextEditingController();
  late var shopDescription = TextEditingController();
  late var shopAddress = TextEditingController();
  late var shopPhoneNum = TextEditingController();
  late var shopEmail = TextEditingController();
  Category? selectedCategory;

  File? shopImage;

  @override
  void initState() {
    super.initState();
    shopNameC = TextEditingController(text: widget.storeData.shopName);
    shopDescription = TextEditingController(
      text: widget.storeData.shopDescription,
    );
    shopAddress = TextEditingController(text: widget.storeData.shopAddress);
    shopPhoneNum = TextEditingController(text: widget.storeData.shopPhoneNum);
    shopEmail = TextEditingController(text: widget.storeData.shopEmail);
    selectedCategory = widget.storeData.category;
    shopImage = widget.storeData.shopLogo;
  }

  void pickImage() async {
    ImagePicker imagePicker = ImagePicker();

    final XFile? image = await imagePicker.pickImage(
      source: ImageSource.gallery,
    );

    if (image != null) {
      setState(() {
        shopImage = File(image.path);
        widget.storeData.shopLogo = shopImage;
      });
    }
  }

  Map<String, Category> categories = {
    'Fashion': Category.fashion,
    'Smartphone & Tablet': Category.smartphoneTablet,
    'Otomotif': Category.otomotif,
    'Sport': Category.sport,
    'Food': Category.food,
    'Voucher Game': Category.voucherGame,
    'Electronic': Category.electronic,
    'Health & Care': Category.healthCare,
  };

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Form(
        key: _key,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Store Information',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 30),
            PickImage(onTap: pickImage, image: shopImage),
            SizedBox(height: 20),
            CreateStoreInputWidget(
              controller: shopNameC,
              hint: 'Enter shop name',
              title: 'Shop Name',
              validator: (p0) {
                if (p0 == null || p0.isEmpty) {
                  return 'Shop name is required';
                }
                return null;
              },
              onChanged: (p0) {
                setState(() {
                  widget.storeData.shopName = shopNameC.text;
                });
              },
            ),
            SizedBox(height: 20),
            DropdownButtonWidget(
              title: 'Shop Category',
              value: selectedCategory,
              dropdown: categories.entries
                  .map(
                    (e) => DropdownMenuItem(value: e.value, child: Text(e.key)),
                  )
                  .toList(),
              validator: (p0) {
                if (p0 == null) {
                  return 'Category is required';
                }
                return null;
              },
              onChanged: (p0) {
                setState(() {
                  selectedCategory = p0;
                  widget.storeData.category = selectedCategory;
                });
              },
            ),
            SizedBox(height: 20),
            CreateStoreInputWidget(
              controller: shopDescription,
              hint: 'Enter shop description',
              title: 'Shop Description',
              validator: (p0) {
                if (p0 == null || p0.isEmpty) {
                  return 'Shop description is required';
                }
                return null;
              },
              onChanged: (p0) {
                setState(() {
                  widget.storeData.shopDescription = shopDescription.text;
                });
              },
            ),
            SizedBox(height: 20),
            CreateStoreInputWidget(
              controller: shopAddress,
              hint: 'Enter shop address',
              title: 'Shop Address',
              validator: (p0) {
                if (p0 == null || p0.isEmpty) {
                  return 'Shop address is required';
                }
                return null;
              },
              onChanged: (p0) {
                setState(() {
                  widget.storeData.shopAddress = shopAddress.text;
                });
              },
            ),
            SizedBox(height: 20),
            CreateStoreInputWidget(
              controller: shopPhoneNum,
              hint: 'Enter shop phone number',
              title: 'Shop Phone Number',
              validator: (p0) {
                if (p0 == null || p0.isEmpty) {
                  return 'Shop phone is required';
                }
                return null;
              },
              onChanged: (p0) {
                setState(() {
                  widget.storeData.shopPhoneNum = shopPhoneNum.text;
                });
              },
            ),
            SizedBox(height: 20),
            CreateStoreInputWidget(
              controller: shopEmail,
              hint: 'Enter shop email',
              title: 'Shop Email',
              validator: (p0) {
                if (p0 == null || p0.isEmpty) {
                  return 'Shop email is required';
                }
                return null;
              },
              onChanged: (p0) {
                setState(() {
                  widget.storeData.shopEmail = shopEmail.text;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
