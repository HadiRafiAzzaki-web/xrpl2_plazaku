import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:xrpl2_plazaku/models/order_model.dart';
import 'package:xrpl2_plazaku/services/app_service.dart';
import 'package:xrpl2_plazaku/utils/price_format.dart';
import 'package:xrpl2_plazaku/utils/product_image.dart';
import 'package:xrpl2_plazaku/widgets/custom_button.dart';

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
    order = orderService.allOrders.firstWhere(
      (element) => element.id == widget.id,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Color statusColor = Colors.grey;
    Color bgColor = Colors.grey.shade100;
    String title = '';

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
                    Text(
                      order.userName,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(order.location, style: TextStyle(color: Colors.grey)),
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
                      itemCount: order.items.length,
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
                                image: order.items[index].product.image,
                              ),
                            ),
                          ),
                          title: Text(
                            order.items[index].product.title,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            formatRupiah(order.items[index].product.price),
                            style: TextStyle(color: Colors.grey),
                          ),
                          trailing: Text('${order.items[index].quantity}'),
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
                    SizedBox(height: 15),
                    if (order.status == ProductStatus.pending)
                      Column(
                        children: [
                          CustomButton(
                            height: 55,
                            width: double.infinity,
                            title: 'Accept Order',
                            onPressed: () {
                              setState(() {
                                order.status = ProductStatus.processed;
                              });
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Order has been processed'),
                                ),
                              );
                            },
                            color: Color(0xFF002AFF),
                            textColor: Colors.white,
                            textSize: 18,
                          ),
                          SizedBox(height: 10),
                          CustomButton(
                            width: double.infinity,
                            height: 55,
                            title: 'Reject Order',
                            onPressed: rejectedShowDialog,
                            color: Colors.red,
                            textColor: Colors.white,
                            textSize: 18,
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

  rejectedShowDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Reject Order?'),
        content: Text(
          'Are you sure you want to reject this order? This action cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancel', style: TextStyle(color: Colors.grey)),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                order.status = ProductStatus.rejected;
              });
              Navigator.pop(context);
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Order Rejected'),
                  backgroundColor: Colors.red,
                ),
              );
            },
            child: Text('Yes', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
