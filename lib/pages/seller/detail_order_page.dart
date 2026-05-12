import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:xrpl2_plazaku/models/order_model.dart';
import 'package:xrpl2_plazaku/utils/display_status.dart';
import 'package:xrpl2_plazaku/utils/price_format.dart';
import 'package:xrpl2_plazaku/utils/product_image.dart';
import 'package:xrpl2_plazaku/widgets/custom_button.dart';

class DetailOrderPage extends StatefulWidget {
  final OrderModel orders;

  const DetailOrderPage({super.key, required this.orders});

  @override
  State<DetailOrderPage> createState() => _DetailOrderPageState();
}

class _DetailOrderPageState extends State<DetailOrderPage> {
  @override
  Widget build(BuildContext context) {
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
                      '${widget.orders.id}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          DateFormat(
                            'dd MMM yyyy - HH:mm',
                          ).format(widget.orders.date),
                          style: TextStyle(color: Colors.grey),
                        ),
                        Card(
                          color:
                              widget.orders.status.backgroundColor ??
                              Color(0xFFFFFFFF),
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Text(
                              widget.orders.status.displayName,
                              style: TextStyle(
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
                      widget.orders.userName,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      widget.orders.location,
                      style: TextStyle(color: Colors.grey),
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
                      itemCount: widget.orders.items.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final product = widget.orders.items[index];
                        return ListTile(
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: buildProductImage(
                              product.product,
                              heightSize: 60,
                              widthSize: 60,
                            ),
                          ),
                          title: Text(
                            product.product.title,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            formatRupiah(product.product.price),
                            style: TextStyle(color: Colors.grey),
                          ),
                          trailing: Text('${product.quantity}'),
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
                          formatRupiah(widget.orders.totalPrice),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    if (widget.orders.status == ProductStatus.pending)
                      Column(
                        children: [
                          CustomButton(
                            title: 'Accept Order',
                            onPressed: () {
                              setState(() {
                                widget.orders.status = ProductStatus.processed;
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
                          ),
                          SizedBox(height: 10),
                          CustomButton(
                            title: 'Reject Order',
                            onPressed: rejectedShowDialog,
                            color: Colors.red,
                            textColor: Colors.white,
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
                widget.orders.status = ProductStatus.rejected;
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
