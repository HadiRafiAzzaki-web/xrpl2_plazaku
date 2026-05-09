import 'package:flutter/material.dart';

class SellerChart extends StatelessWidget {
  const SellerChart({super.key});

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
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Seller Graphic',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 20),
            SizedBox(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildBar(60),
                  buildBar(80),
                  buildBar(110),
                  buildBar(140),
                  buildBar(180),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBar(double height) {
    return Container(
      width: 30,
      height: height,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(6),
      ),
    );
  }
}
