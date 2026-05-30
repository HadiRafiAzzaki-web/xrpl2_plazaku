import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:xrpl2_plazaku/pages/seller/widgets/add_product_category.dart';
import 'package:xrpl2_plazaku/pages/seller/widgets/add_product_image_picker.dart';
import 'package:xrpl2_plazaku/widgets/custom_button.dart';
import 'package:xrpl2_plazaku/widgets/custom_input_field.dart';

import '../../models/product_model.dart';
import '../../models/variant_model.dart';
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
  final locationController = TextEditingController();
  final variantNameController = TextEditingController();
  final variantOptionsController = TextEditingController();

  late Category selectedCategory;

  File? imageFile;
  List<VariantModel> productVariants = [];
  final picker = ImagePicker();

  void addVariant() {
    String name = variantNameController.text.trim();
    String options = variantOptionsController.text.trim();

    if (name.isNotEmpty && options.isNotEmpty) {
      List<String> optionsList = options
          .split(',')
          .map((e) => e.trim())
          .toList();

      setState(() {
        productVariants.add(VariantModel(name: name, options: optionsList));
        variantNameController.clear();
        variantOptionsController.clear();
      });
    }
  }

  void saveProduct() {
    if (!_formKey.currentState!.validate()) {
      return;
    } else {
      final user = appService.userModel;
      if (user == null) return;
      final product = ProductModel(
        sellerId: user.sellerId,
        id: DateTime.now().millisecondsSinceEpoch,
        stock: int.parse(stockController.text),
        description: descriptionController.text,
        title: nameController.text,
        image: imageFile?.path ?? 'assets/images/no-image.png',
        price: int.parse(priceController.text),
        category: selectedCategory,
        rating: 0,
        review: 0,
        location: locationController.text,
        variants: productVariants,
      );
      productService.addProduct(product);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Product added'), backgroundColor: Colors.green),
      );
      Navigator.pop(context);
    }
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
              AddProductImagePicker(onTap: pickImage, imageFile: imageFile),
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
                  if (value == null || value.trim().isEmpty) {
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
                    selectedCategory = p0!;
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
                  if (value == null || value.trim().isEmpty) {
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
                  if (value == null || value.trim().isEmpty) {
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
              SizedBox(height: 20),
              Text('Location', style: TextStyle(fontWeight: FontWeight.bold)),
              CustomInputField(
                controller: locationController,
                keyboardType: TextInputType.text,
                obscure: false,
                hint: 'Enter your location',
                suffixIcon: Icon(null),
                validator: (p0) {
                  if (p0 == null || p0.trim().isEmpty) {
                    return 'Location required';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              Text(
                'Add Variant',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Column(
                children: [
                  CustomInputField(
                    controller: variantNameController,
                    hint: 'Variant Name (example: Color, Size)',
                    obscure: false,
                    suffixIcon: Icon(null),
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(height: 8),
                  CustomInputField(
                    controller: variantOptionsController,
                    hint: 'Option (separate with commas,, example: Red, Blue)',
                    obscure: false,
                    suffixIcon: Icon(null),
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(height: 8),
                  ElevatedButton.icon(
                    onPressed: addVariant,
                    icon: Icon(Icons.add),
                    label: Text("Add Variant to product"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade50,
                      foregroundColor: Color(0xFF002AFF),
                    ),
                  ),
                ],
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: productVariants.length,
                itemBuilder: (context, index) {
                  final variant = productVariants[index];
                  return ListTile(
                    title: Text(
                      variant.name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text("Option: ${variant.options.join(', ')}"),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () =>
                          setState(() => productVariants.removeAt(index)),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(12),
        child: CustomButton(
          width: double.infinity,
          height: 55,
          title: '+ Save Product',
          onPressed: () {
            setState(() {
              saveProduct();
            });
          },
          color: Color(0xFF002AFF),
          textColor: Colors.white,
          textSize: 18,
        ),
      ),
    );
  }

  Future<void> pickImage() async {
    ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        imageFile = File(image.path);
      });
    }
  }
}
