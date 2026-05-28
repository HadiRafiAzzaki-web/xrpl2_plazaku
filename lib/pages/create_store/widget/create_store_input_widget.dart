import 'package:flutter/material.dart';

import '../../../widgets/custom_input_field.dart';

class CreateStoreInputWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final String title;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;

  const CreateStoreInputWidget({
    super.key,
    required this.controller,
    required this.hint,
    required this.title,
    this.validator,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        SizedBox(height: 15),
        CustomInputField(
          controller: controller,
          keyboardType: TextInputType.text,
          obscure: false,
          hint: hint,
          suffixIcon: Icon(null),
          validator: validator,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
