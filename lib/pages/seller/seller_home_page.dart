import 'package:flutter/material.dart';
import 'package:xrpl2_plazaku/models/order_model.dart';
import 'package:xrpl2_plazaku/services/app_service.dart';
import 'package:xrpl2_plazaku/utils/price_format.dart';
import 'package:xrpl2_plazaku/widgets/seller_card.dart';
import 'package:xrpl2_plazaku/widgets/seller_date_picker.dart';
import 'package:xrpl2_plazaku/widgets/seller_order_in.dart';

import '../../widgets/seller_chart.dart';

class SellerHomePage extends StatefulWidget {
  const SellerHomePage({super.key});

  @override
  State<SellerHomePage> createState() => _SellerHomePageState();
}

class _SellerHomePageState extends State<SellerHomePage> {
  DateTimeRange? selectedDate;

  @override
  Widget build(BuildContext context) {
    final user = appService.userModel!;
    final pending = orderService.countByStatus(
      ProductStatus.pending,
      user.sellerId,
    );
    final processed = orderService.countByStatus(
      ProductStatus.processed,
      user.sellerId,
    );
    final sent = orderService.countByStatus(ProductStatus.sent, user.sellerId);
    final finish = orderService.countByStatus(
      ProductStatus.finish,
      user.sellerId,
    );
    final totalOrderIn = orderService.allOrders
        .where((element) => element.sellerId == user.sellerId)
        .length;
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Color(0xFFF5F5F5),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Halo! ${user.username}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('Welcome back!', style: TextStyle(fontSize: 14)),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications, size: 40, color: Colors.black),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(40),
          child: Divider(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            SellerDatePicker(onTap: pickDateRange, selectedDate: selectedDate),
            SizedBox(height: 20),
            Column(
              children: [
                GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1.2,
                  children: [
                    SellerCard(
                      title: 'Total Sales',
                      value: formatRupiah(
                        orderService.totalRevenue(user.sellerId, selectedDate),
                      ),
                      percentage: 12.5,
                    ),
                    SellerCard(
                      title: 'Total Orders',
                      value:
                          '${orderService.countByStatus(ProductStatus.finish, user.sellerId)}',
                      percentage: 12.5,
                    ),
                    SellerCard(
                      title: 'Products',
                      value:
                          '${productService.sellerProducts(user.sellerId).length}',
                      percentage: 12.5,
                    ),
                    SellerCard(
                      title: 'Visitors',
                      value: '1.2K',
                      percentage: 12.5,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sales Chart',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        height: 300,
                        child: SellerChart(
                          date: selectedDate,
                          sellerId: user.sellerId,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            SellerOrderIn(
              finish: finish,
              pending: pending,
              processed: processed,
              sent: sent,
              total: totalOrderIn,
            ),
          ],
        ),
      ),
    );
  }

  //get date from dropdown
  Future<void> pickDateRange() async {
    final result = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );

    if (result != null) {
      setState(() {
        selectedDate = result;
      });
    }
  }
}
