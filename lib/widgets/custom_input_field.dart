import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final bool obscure;
  final String hint;
  final Widget suffixIcon;

  const CustomInputField({
    super.key,
    required this.controller,
    required this.keyboardType,
    this.validator,
    required this.obscure,
    required this.hint,
    required this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      controller: controller,
      obscureText: obscure,
      validator: validator,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Color(0xFF000000)),
        ),
        filled: true,
        fillColor: Colors.white,
        hint: Text(hint),
        suffixIcon: suffixIcon,
        alignLabelWithHint: true,
      ),
    );
  }
}
