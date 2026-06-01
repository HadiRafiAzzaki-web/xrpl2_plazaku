import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:xrpl2_plazaku/models/order_model.dart';
import 'package:xrpl2_plazaku/services/app_service.dart';

import '../../../modeOrRole/delivery_method.dart';
import '../../../modeOrRole/payment_method.dart';
import '../../../utils/price_format.dart';
import '../../../utils/product_image.dart';

class DetailOrderPage extends StatefulWidget {
  final int id;

  const DetailOrderPage({super.key, required this.id});

  @override
  State<DetailOrderPage> createState() => _DetailOrderPageState();
}

class _DetailOrderPageState extends State<DetailOrderPage> {
  late OrderModel order;

  @override
  void initState() {
    super.initState();
    order = orderService.allOrders.firstWhere(
      (element) => element.id == widget.id,
    );
  }

  @override
  Widget build(BuildContext context) {
    Color statusColor = Colors.grey;
    Color bgColor = Colors.grey.shade100;
    String title = '';
    String payment = '';
    String delivery = '';

    if (order.paymentMethod == PaymentMethod.cod) {
      payment = 'Cash on Delivery';
    } else if (order.paymentMethod == PaymentMethod.eWallet) {
      payment = 'E-Wallet';
    } else {
      payment = 'Transfer';
    }

    if (order.deliveryMethod == DeliveryMethod.expeditionCourier) {
      delivery = 'Expedition Courier';
    } else {
      delivery = 'Take it Yourself';
    }

    if (order.status == ProductStatus.pending) {
      statusColor = Colors.orange;
      bgColor = Colors.orange.shade50;
      title = 'Pending';
    } else if (order.status == ProductStatus.processed) {
      statusColor = Colors.blue;
      bgColor = Colors.blue.shade50;
      title = 'Processed';
    } else if (order.status == ProductStatus.sent) {
      statusColor = Colors.green;
      bgColor = Colors.green.shade50;
      title = 'Sent';
    } else if (order.status == ProductStatus.rejected) {
      statusColor = Colors.red;
      bgColor = Color(0xFFFFEBEE);
      title = 'Rejected';
    } else {
      statusColor = Colors.grey;
      bgColor = Colors.grey.shade50;
      title = 'Finish';
    }
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Color(0xFFF5F5F5),
        title: Text('Order Detail'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Card(
              elevation: 2,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '${order.id}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          DateFormat('dd MMM yyyy - HH:mm').format(order.date),
                          style: TextStyle(color: Colors.grey),
                        ),
                        Card(
                          color: bgColor,
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Text(
                              title,
                              style: TextStyle(
                                color: statusColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Divider(),
                    Text('Customer Data'),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              order.userName,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              order.location,
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(payment, style: TextStyle(color: Colors.grey)),
                            Text(
                              delivery,
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Divider(),
                    Text(
                      'Product',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 15),
                    ListView.builder(
                      itemCount: order.products.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: SizedBox(
                              height: 60,
                              width: 60,
                              child: ProductImage(
                                image: order.products[index].product.image,
                              ),
                            ),
                          ),
                          title: Text(
                            order.products[index].product.title,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                formatRupiah(
                                  order.products[index].product.price,
                                ),
                                style: TextStyle(color: Colors.grey),
                              ),
                              SizedBox(height: 5),
                              Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: order.products[index].variants
                                    .map(
                                      (e) => Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 6,
                                          vertical: 2,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.grey.shade200,
                                          borderRadius: BorderRadius.circular(
                                            4,
                                          ),
                                        ),
                                        child: Text(
                                          '${e.name}: ${e.options.join(", ")}',
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
                          trailing: Text('${order.products[index].quantity}'),
                        );
                      },
                    ),
                    Divider(),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total Order',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          formatRupiah(order.totalPrice),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
