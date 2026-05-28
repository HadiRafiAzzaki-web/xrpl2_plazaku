import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:xrpl2_plazaku/datas/data_account.dart';
import 'package:xrpl2_plazaku/datas/order_data.dart';
import 'package:xrpl2_plazaku/modeOrRole/role.dart';
import 'package:xrpl2_plazaku/pages/admin/widgets/admin_card.dart';
import 'package:xrpl2_plazaku/pages/admin/widgets/admin_seller_chart.dart';
import 'package:xrpl2_plazaku/pages/admin/widgets/order_status_chart_pie.dart';
import 'package:xrpl2_plazaku/services/app_service.dart';
import 'package:xrpl2_plazaku/utils/price_format.dart';

import '../../models/order_model.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({super.key});

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  Timer? timer;
  DateTime now = DateTime.now();

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(minutes: 1), (timer) {
      setState(() {
        now = DateTime.now();
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  final sellerUser = users
      .where((element) => element.role == Role.seller)
      .toList();

  int totalRevenue = orders
      .where((element) => element.status == ProductStatus.finish)
      .fold(0, (previousValue, element) => previousValue + element.totalPrice);

  @override
  Widget build(BuildContext context) {
    final user = appService.userModel;
    if (user == null) {
      return Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Color(0xFFF5F5F5),
        title: Text(
          DateFormat('dd MMM yyyy - HH:mm').format(now),
          style: TextStyle(fontSize: 13),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(35),
              child: Image.asset(
                'assets/images/milea.jpg',
                fit: BoxFit.cover,
                width: 35,
                height: 35,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome back, ${user.username}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 40),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.2,
              children: [
                AdminCard(
                  title: 'Total Users',
                  value: '${users.length}',
                  percentage: 12,
                ),
                AdminCard(
                  title: 'Total Seller',
                  value: '${sellerUser.length}',
                  percentage: 12,
                ),
                AdminCard(
                  title: 'Total Orders',
                  value: '${orders.length}',
                  percentage: 12,
                ),
                AdminCard(
                  title: 'Total Revenue',
                  value: formatRupiah(totalRevenue),
                  percentage: 12,
                ),
              ],
            ),
            SizedBox(height: 40),
            //bar chart
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sales Chart',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(height: 20),
                  SizedBox(height: 300, child: AdminSellerChart()),
                ],
              ),
            ),
            SizedBox(height: 40),
            //pie chart
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                border: Border.all(color: Colors.grey),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Orders Status',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(height: 20),
                  SizedBox(height: 300, child: OrderStatusChartPie()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
