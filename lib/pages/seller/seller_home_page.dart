import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
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

  //generate chart
  List<FlSpot> generateChartData() {
    //get all finish order
    try {
      var orders = orderService.allOrders
          .where((o) => o.status == 'Finish')
          .toList();

      if (selectedDate != null) {
        orders = orders.where((o) {
          return o.date.isAfter(
                selectedDate!.start.subtract(const Duration(days: 1)),
              ) &&
              o.date.isBefore(selectedDate!.end.add(const Duration(days: 1)));
        }).toList();
      }

      orders.sort((a, b) => a.date.compareTo(b.date));

      if (orders.isEmpty) {
        return [
          const FlSpot(0, 0),
        ]; // Kembalikan titik nol agar chart tidak error
      }

      return List.generate(orders.length, (i) {
        return FlSpot(i.toDouble(), orders[i].totalAmount.toDouble());
      });
    } catch (e) {
      return [const FlSpot(0, 0)];
    }
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

  @override
  Widget build(BuildContext context) {
    final user = appService.currentUser!;
    final pending = orderService.countByStatus('Pending');
    final processed = orderService.countByStatus('Processed');
    final sent = orderService.countByStatus('Sent');
    final finish = orderService.countByStatus('Finish');
    final totalOrderIn = orderService.allOrders.length;
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
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              SellerDatePicker(
                onTap: pickDateRange,
                selectedDate: selectedDate,
              ),
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
                        value: formatRupiah(orderService.totalRevenue),
                        percentage: 12.5,
                      ),
                      SellerCard(
                        title: 'Total Orders',
                        value: '${orderService.allOrders.length}',
                        percentage: 12.5,
                      ),
                      SellerCard(
                        title: 'Products',
                        value:
                            '${productService.sellerProducts(user.id).length}',
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
                  SellerChart(),
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
      ),
    );
  }
}
