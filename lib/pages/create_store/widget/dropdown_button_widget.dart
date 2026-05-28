import 'package:flutter/material.dart';

class DropdownButtonWidget<T> extends StatelessWidget {
  final String title;
  final List<DropdownMenuItem<T>> dropdown;
  final T? value;
  final String? Function(T?)? validator;
  final Function(T?) onChanged;

  const DropdownButtonWidget({
    super.key,
    required this.title,
    required this.dropdown,
    this.value,
    this.validator,
    required this.onChanged,
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
        DropdownButtonFormField<T>(
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
          ),
          items: dropdown,
          value: value,
          onChanged: onChanged,
          validator: validator,
        ),
      ],
    );
  }
}
