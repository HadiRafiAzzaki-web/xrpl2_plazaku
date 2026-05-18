import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xrpl2_plazaku/models/checkout_model.dart';
import 'package:xrpl2_plazaku/services/app_service.dart';
import 'package:xrpl2_plazaku/utils/price_format.dart';
import 'package:xrpl2_plazaku/widgets/address_card.dart';

import '../../widgets/custom_button.dart';

class CheckoutPage extends StatefulWidget {
  final CheckoutModel checkoutModel;

  const CheckoutPage({super.key, required this.checkoutModel});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    final user = appService.userModel!;
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Color(0xFFF5F5F5),
        title: Text('Checkout'),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(30),
          child: Divider(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Address',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            AddressCard(checkoutModel: widget.checkoutModel, user: user),
            SizedBox(height: 20),
            Text(
              'Delivery Time',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Icon(CupertinoIcons.car),
                      SizedBox(width: 5),
                      Text(
                        'Within 2 days',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Change',
                      style: TextStyle(color: Colors.blueAccent, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Payment Method',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Icon(Icons.money),
                      SizedBox(width: 5),
                      Text(
                        'Cash on delivery',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Change',
                      style: TextStyle(color: Colors.blueAccent, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Text(
                    'Voucher code',
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Color(0xFF002AFF)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      'Apply',
                      style: TextStyle(color: Colors.blue, fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Payment',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                border: Border.all(color: Colors.grey),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Subtotal(${widget.checkoutModel.totalItems})',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(formatRupiah(widget.checkoutModel.totalPrice)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Delivery Fees',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(formatRupiah(10000)),
                    ],
                  ),
                  Divider(color: Colors.black),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        formatRupiah(widget.checkoutModel.totalPrice + 10000),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(12),
        color: Colors.white,
        child: CustomButton(
          height: 55,
          width: double.infinity,
          title: 'Place Order',
          onPressed: () {
            final order = checkoutService.createOrder(widget.checkoutModel);
            orderService.allOrders.add(order);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Order success'),
                backgroundColor: Colors.green,
              ),
            );
            Navigator.pop(context);
          },
          color: Colors.black,
          textColor: Colors.white,
        ),
      ),
    );
  }
}
