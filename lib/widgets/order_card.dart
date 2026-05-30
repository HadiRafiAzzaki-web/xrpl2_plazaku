import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:xrpl2_plazaku/models/order_model.dart';

import '../utils/price_format.dart';

class OrderCard extends StatelessWidget {
  final VoidCallback onTap;
  final ProductStatus status;
  final int orderId;
  final DateTime orderDate;
  final String userName;
  final int totalPrice;

  const OrderCard({
    super.key,
    required this.onTap,
    required this.status,
    required this.orderId,
    required this.orderDate,
    required this.userName,
    required this.totalPrice,
  });

  @override
  Widget build(BuildContext context) {
    Color statusColor = Colors.grey;
    Color bgColor = Colors.grey.shade100;
    String title = '';

    if (status == ProductStatus.pending) {
      statusColor = Colors.orange;
      bgColor = Colors.orange.shade50;
      title = 'Pending';
    } else if (status == ProductStatus.processed) {
      statusColor = Colors.blue;
      bgColor = Colors.blue.shade50;
      title = 'Processed';
    } else if (status == ProductStatus.sent) {
      statusColor = Colors.green;
      bgColor = Colors.green.shade50;
      title = 'Sent';
    } else if (status == ProductStatus.rejected) {
      statusColor = Colors.red;
      bgColor = Color(0xFFFFEBEE);
      title = 'Rejected';
    } else {
      statusColor = Colors.grey;
      bgColor = Colors.grey.shade50;
      title = 'Finish';
    }
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade100),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('$orderId', style: TextStyle(fontWeight: FontWeight.bold)),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: bgColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    title,
                    style: TextStyle(
                      color: statusColor,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Text(
              DateFormat('dd MMM yyyy - HH:mm').format(orderDate),
              style: TextStyle(color: Colors.grey, fontSize: 11),
            ),
            SizedBox(height: 12),
            Row(
              children: [
                CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.blue,
                  child: Icon(Icons.person, size: 20, color: Colors.white),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userName,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  formatRupiah(totalPrice),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
