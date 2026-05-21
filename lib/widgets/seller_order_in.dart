import 'package:flutter/material.dart';
import 'package:xrpl2_plazaku/pages/seller/seller_order_page.dart';
import 'package:xrpl2_plazaku/widgets/order_status.dart';

class SellerOrderIn extends StatelessWidget {
  final int total;
  final int pending;
  final int processed;
  final int sent;
  final int finish;

  const SellerOrderIn({
    super.key,
    required this.total,
    required this.pending,
    required this.processed,
    required this.sent,
    required this.finish,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Incoming Orders',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SellerOrderPage(),
                      ),
                    );
                  },
                  child: Text('See All', style: TextStyle(color: Colors.blue)),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              '$total',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: OrderStatus(
                    title: '$pending',
                    subtitle: 'Pending',
                    color: Color(0xFFFFF8E7),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: OrderStatus(
                    title: '$processed',
                    subtitle: 'Processed',
                    color: Color(0xFFEFF4FF),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: OrderStatus(
                    title: '$sent',
                    subtitle: 'Sent',
                    color: Color(0xFFEAFBF3),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: OrderStatus(
                    title: '$finish',
                    subtitle: 'Finish',
                    color: Color(0xFFF5F5F5),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
