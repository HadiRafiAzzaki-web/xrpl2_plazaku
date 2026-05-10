import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:xrpl2_plazaku/widgets/add_product_category.dart';
import 'package:xrpl2_plazaku/widgets/add_product_image_picker.dart';
import 'package:xrpl2_plazaku/widgets/custom_button.dart';
import 'package:xrpl2_plazaku/widgets/custom_input_field.dart';

import '../../models/product_model.dart';
import '../../services/app_service.dart';

class SellerAddProduct extends StatefulWidget {
  const SellerAddProduct({super.key});

  @override
  State<SellerAddProduct> createState() => _SellerAddProductState();
}

class _SellerAddProductState extends State<SellerAddProduct> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final stockController = TextEditingController();
  final descriptionController = TextEditingController();

  Category? selectedCategory;

  File? imageFile;
  Uint8List? webImage;
  final picker = ImagePicker();

  Future<void> pickImage() async {
    ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      var f = await image.readAsBytes();
      setState(() {
        webImage = f;
        imageFile = File(image.path);
      });
    }
  }

  void saveProduct() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final user = appService.currentUser!;

    final product = ProductModel(
      DateTime.now().millisecondsSinceEpoch,
      user.id,
      int.parse(stockController.text),
      descriptionController.text,
      webImage: webImage,
      title: nameController.text,
      image: imageFile?.path ?? 'assets/images/no-image.png',
      price: int.parse(priceController.text),
      category: selectedCategory!,
      rating: 0,
      review: 0,
      location: 'Indonesia',
      variants: [],
    );

    productService.addProduct(product);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Product added'), backgroundColor: Colors.green),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        title: Text('Add Product'),
        backgroundColor: Color(0xFFF5F5F5),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AddProductImagePicker(
                onTap: pickImage,
                imageFile: imageFile,
                webImage: webImage,
              ),
              SizedBox(height: 20),
              Text(
                'Name Product',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              CustomInputField(
                controller: nameController,
                keyboardType: TextInputType.text,
                obscure: false,
                hint: 'Enter the product name',
                suffixIcon: Icon(null),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Name required';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              AddProductCategory(
                selectedCategory: selectedCategory,
                onChanged: (p0) {
                  setState(() {
                    selectedCategory = p0;
                  });
                },
              ),
              SizedBox(height: 20),
              Text('Price', style: TextStyle(fontWeight: FontWeight.bold)),
              CustomInputField(
                controller: priceController,
                keyboardType: TextInputType.number,
                obscure: false,
                hint: 'Rp 0',
                suffixIcon: Icon(null),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Price required';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              Text('Stock', style: TextStyle(fontWeight: FontWeight.bold)),
              CustomInputField(
                controller: stockController,
                keyboardType: TextInputType.number,
                obscure: false,
                hint: '0',
                suffixIcon: Icon(null),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Stock required';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              Text(
                'Description',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              CustomInputField(
                controller: descriptionController,
                keyboardType: TextInputType.text,
                obscure: false,
                hint: 'Enter product description',
                suffixIcon: Icon(null),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(12),
        child: CustomButton(
          title: '+ Save Product',
          onPressed: () {
            setState(() {
              saveProduct();
            });
          },
          color: Color(0xFF002AFF),
          textColor: Colors.white,
        ),
      ),
    );
  }
}
