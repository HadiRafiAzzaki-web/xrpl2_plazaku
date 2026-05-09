import 'package:flutter/material.dart';
import 'package:xrpl2_plazaku/pages/seller/seller_see_all_page.dart';

class SellerOrderIn extends StatelessWidget {
  const SellerOrderIn({super.key});

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
                        builder: (context) => SellerSeeAllPage(),
                      ),
                    );
                  },
                  child: Text('See All', style: TextStyle(color: Colors.blue)),
                ),
              ],
            ),
            SizedBox(height: 10),
            //total order
            Text(
              '45',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            //status order
            Row(
              children: [
                Expanded(
                  child: buildOrderStatus(
                    title: '12',
                    subtitle: 'Pending',
                    color: Color(0xFFFFF8E7),
                  ),
                ),

                SizedBox(width: 10),

                Expanded(
                  child: buildOrderStatus(
                    title: '18',
                    subtitle: 'Processed',
                    color: Color(0xFFEFF4FF),
                  ),
                ),

                SizedBox(width: 10),

                Expanded(
                  child: buildOrderStatus(
                    title: '10',
                    subtitle: 'Sent',
                    color: Color(0xFFEAFBF3),
                  ),
                ),

                SizedBox(width: 10),

                Expanded(
                  child: buildOrderStatus(
                    title: '5',
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

  Widget buildOrderStatus({
    required String title,
    required String subtitle,
    required Color color,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14),

      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),

      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),

          SizedBox(height: 4),

          Text(subtitle, style: TextStyle(color: Colors.black54, fontSize: 13)),
        ],
      ),
    );
  }
}
