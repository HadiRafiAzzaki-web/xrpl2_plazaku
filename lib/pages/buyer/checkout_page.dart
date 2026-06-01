import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xrpl2_plazaku/modeOrRole/delivery_method.dart';
import 'package:xrpl2_plazaku/modeOrRole/payment_method.dart';
import 'package:xrpl2_plazaku/models/checkout_model.dart';
import 'package:xrpl2_plazaku/services/app_service.dart';
import 'package:xrpl2_plazaku/utils/price_format.dart';
import 'package:xrpl2_plazaku/widgets/address_card.dart';

import '../../utils/product_image.dart';
import '../../widgets/custom_button.dart';

class CheckoutPage extends StatefulWidget {
  final int checkoutId;

  const CheckoutPage({super.key, required this.checkoutId});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  var voucherCode = TextEditingController();
  late CheckoutModel checkout;
  late DeliveryMethod selectedDelivery;
  late PaymentMethod selectedPayment;

  @override
  void initState() {
    checkout = checkoutService.checkouts.firstWhere(
      (element) => element.id == widget.checkoutId,
    );
    selectedDelivery = DeliveryMethod.expeditionCourier;
    selectedPayment = PaymentMethod.cod;
    super.initState();
  }

  final Map<String, DeliveryMethod> deliveryMethod = {
    'Take it Yourself': DeliveryMethod.takeItYourself,
    'Expedition Courier': DeliveryMethod.expeditionCourier,
  };

  final Map<String, PaymentMethod> paymentMethod = {
    'Transfer': PaymentMethod.transfer,
    'Cash on Delivery': PaymentMethod.cod,
    'E-wallet': PaymentMethod.eWallet,
  };

  String delivery(DeliveryMethod method) {
    switch (method) {
      case DeliveryMethod.takeItYourself:
        return 'Take it Yourself';
      case DeliveryMethod.expeditionCourier:
        return 'Expedition Courier';
      case DeliveryMethod.all:
        return '';
    }
  }

  String payment(PaymentMethod method) {
    switch (method) {
      case PaymentMethod.transfer:
        return 'Transfer';
      case PaymentMethod.cod:
        return 'Cash on Delivery';
      case PaymentMethod.eWallet:
        return 'E-wallet';
      case PaymentMethod.all:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = appService.userModel;
    if (user == null) {
      return Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    final productImage = checkout.productsQuantity
        .map((e) => e.product.image)
        .toList();
    final productName = checkout.productsQuantity
        .map((e) => e.product.title)
        .toList();
    final productPrice = checkout.productsQuantity
        .map((e) => e.product.price)
        .toList();
    final productQuantity = checkout.productsQuantity
        .map((e) => e.quantity)
        .toList();
    int deliveryFee = selectedDelivery == DeliveryMethod.takeItYourself
        ? 0
        : 10000;
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
            AddressCard(user: user),
            SizedBox(height: 20),
            Text(
              'Delivery',
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
                        delivery(selectedDelivery),
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      showDeliveryMethod();
                    },
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
                        payment(selectedPayment),
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      showPaymentMethod();
                    },
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
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 165),
                    child: TextField(
                      controller: voucherCode,
                      decoration: InputDecoration(
                        hintText: 'Voucher code',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.grey.shade50),
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Voucher code used')),
                    );
                  },
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
              'Product',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  ListView.separated(
                    padding: EdgeInsets.all(12),
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: SizedBox(
                          height: 60,
                          width: 60,
                          child: ProductImage(image: productImage[index]),
                        ),
                      ),
                      title: Text(
                        productName[index],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            formatRupiah(productPrice[index]),
                            style: TextStyle(color: Colors.grey),
                          ),
                          SizedBox(height: 5),
                          Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: checkout.productsQuantity[index].variants
                                .map(
                                  (e) => Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 6,
                                      vertical: 2,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Text(
                                      '${e.name}: ${e.options}',
                                      style: TextStyle(
                                        fontSize: 11,
                                        color: Colors.grey.shade800,
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ],
                      ),
                      trailing: Text('${productQuantity[index]}'),
                    ),
                    separatorBuilder: (context, index) => SizedBox(height: 5),
                    itemCount: checkout.productsQuantity.length,
                  ),
                ],
              ),
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
                        'Subtotal(${checkout.totalProducts})',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(formatRupiah(checkout.totalPrice)),
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
                      Text(formatRupiah(deliveryFee)),
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
                      Text(formatRupiah(checkout.totalPrice + deliveryFee)),
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
            checkout.paymentMethod = selectedPayment;
            checkout.deliveryMethod = selectedDelivery;
            orderService.allOrders.add(
              checkoutService.createOrder(checkout, user.id),
            );
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
          textSize: 18,
        ),
      ),
    );
  }

  void showDeliveryMethod() {
    final titles = deliveryMethod.keys.toList();
    final values = deliveryMethod.values.toList();
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SizedBox(
          height: 300,
          child: ListView.builder(
            itemCount: deliveryMethod.length,
            padding: EdgeInsets.all(12),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedDelivery = values[index];
                  });

                  Navigator.pop(context);
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 10),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(titles[index], style: TextStyle(fontSize: 16)),
                        if (selectedDelivery == values[index])
                          Icon(Icons.check, color: Colors.green),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  void showPaymentMethod() {
    final titles = paymentMethod.keys.toList();
    final values = paymentMethod.values.toList();
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SizedBox(
          height: 300,
          child: ListView.builder(
            itemCount: paymentMethod.length,
            padding: EdgeInsets.all(12),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedPayment = values[index];
                  });

                  Navigator.pop(context);
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 10),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(titles[index]),

                        if (selectedPayment == values[index])
                          Icon(Icons.check, color: Colors.green),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
