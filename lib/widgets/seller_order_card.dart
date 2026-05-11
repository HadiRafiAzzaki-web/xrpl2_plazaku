import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:xrpl2_plazaku/models/order_model.dart';
import 'package:xrpl2_plazaku/utils/display_status.dart';

import '../utils/price_format.dart';

class SellerOrderCard extends StatelessWidget {
  final VoidCallback onTap;
  final OrderModel order;

  const SellerOrderCard({super.key, required this.order, required this.onTap});

  @override
  Widget build(BuildContext context) {
    Color statusColor = Colors.grey;
    Color bgColor = Colors.grey.shade100;

    if (order.status == ProductStatus.pending) {
      statusColor = Colors.orange;
      bgColor = Colors.orange.shade50;
    } else if (order.status == ProductStatus.processed) {
      statusColor = Colors.blue;
      bgColor = Colors.blue.shade50;
    } else if (order.status == ProductStatus.sent) {
      statusColor = Colors.green;
      bgColor = Colors.green.shade50;
    } else if (order.status == ProductStatus.rejected) {
      statusColor = Colors.red;
      bgColor = Color(0xFFFFEBEE);
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
                Text(
                  '${order.id}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: bgColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    order.status.displayName,
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
              DateFormat('dd MMM yyyy - HH:mm').format(order.date),
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
                        order.userName,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  formatRupiah(order.totalAmount),
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
