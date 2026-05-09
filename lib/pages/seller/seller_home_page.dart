import 'package:flutter/material.dart';
import 'package:xrpl2_plazaku/services/app_service.dart';
import 'package:xrpl2_plazaku/widgets/seller_card.dart';
import 'package:xrpl2_plazaku/widgets/seller_chart.dart';
import 'package:xrpl2_plazaku/widgets/seller_date_picker.dart';
import 'package:xrpl2_plazaku/widgets/seller_order_in.dart';

import '../../utils/price_format.dart';

class SellerHomePage extends StatefulWidget {
  const SellerHomePage({super.key});

  @override
  State<SellerHomePage> createState() => _SellerHomePageState();
}

class _SellerHomePageState extends State<SellerHomePage> {
  DateTimeRange? selectedDate;

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
    final totalSales = salesService.totalSales(selectedDate);
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
                        value: formatRupiah(totalSales),
                        percentage: 12.2,
                      ),
                      SellerCard(
                        title: 'Total Order',
                        value: '129',
                        percentage: 12.2,
                      ),
                      SellerCard(
                        title: 'Product',
                        value: '56',
                        percentage: 2.5,
                      ),
                      SellerCard(
                        title: 'Visitor',
                        value: '1.267',
                        percentage: 6.5,
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  SellerChart(),
                ],
              ),
              SizedBox(height: 20),
              SellerOrderIn(),
            ],
          ),
        ),
      ),
    );
  }
}
