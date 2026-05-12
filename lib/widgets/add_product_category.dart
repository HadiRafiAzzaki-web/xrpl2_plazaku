import 'package:flutter/material.dart';
import 'package:xrpl2_plazaku/models/product_model.dart';

class AddProductCategory extends StatelessWidget {
  final Category? selectedCategory;
  final Function(Category?) onChanged;

  const AddProductCategory({
    super.key,
    this.selectedCategory,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Category', style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        DropdownButtonFormField<Category>(
          value: selectedCategory,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
          ),
          hint: Text('Select a category'),
          items: Category.values.map((e) {
            return DropdownMenuItem(value: e, child: Text(e.name));
          }).toList(),
          onChanged: onChanged,
          validator: (value) {
            if (value == null) {
              return 'Select category';
            }
            return null;
          },
        ),
      ],
    );
  }
}
