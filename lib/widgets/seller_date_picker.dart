import 'package:flutter/material.dart';

class SellerDatePicker extends StatelessWidget {
  final DateTimeRange? selectedDate;
  final VoidCallback onTap;

  const SellerDatePicker({super.key, this.selectedDate, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 3,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 14, horizontal: 14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.calendar_today, size: 18, color: Colors.grey),
                  SizedBox(width: 10),
                  Text(
                    selectedDate == null
                        ? 'Select Date'
                        : '${selectedDate!.start.day}/${selectedDate!.start.month}/${selectedDate!.start.year} - ${selectedDate!.end.day}/${selectedDate!.end.month}/${selectedDate!.end.year}',
                  ),
                ],
              ),
              Icon(Icons.keyboard_arrow_down),
            ],
          ),
        ),
      ),
    );
  }
}
