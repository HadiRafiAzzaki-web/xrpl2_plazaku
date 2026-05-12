import 'package:flutter/material.dart';

import '../services/order_service.dart';

class SellerChart extends StatelessWidget {
  final DateTimeRange? selectedDate;

  const SellerChart({super.key, this.selectedDate});

  @override
  Widget build(BuildContext context) {
    final rawData = orderService.chartDataByDate(selectedDate);

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sales Graphic',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 200,
              child: rawData.isEmpty
                  ? Center(child: Text('Sales empty'))
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: rawData.entries.map((entry) {
                        return buildBar(entry.value, entry.key);
                      }).toList(),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBar(double amount, String label) {
    double displayHeight = (amount / 1000000) * 50;
    if (displayHeight < 10) displayHeight = 10;
    if (displayHeight > 150) displayHeight = 150;

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          amount >= 1000000
              ? '${(amount / 1000000).toStringAsFixed(1)}M'
              : '${(amount / 1000).toStringAsFixed(0)}K',
          style: TextStyle(fontSize: 9, color: Colors.grey),
        ),
        SizedBox(height: 4),
        Container(
          width: 25,
          height: displayHeight,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.blue.shade400, Colors.blue.shade700],
            ),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(6),
              topRight: Radius.circular(6),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 10, color: Colors.grey)),
      ],
    );
  }
}
