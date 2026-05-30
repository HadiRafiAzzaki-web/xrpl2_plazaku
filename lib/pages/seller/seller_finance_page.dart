import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:xrpl2_plazaku/models/order_model.dart';
import 'package:xrpl2_plazaku/pages/seller/widgets/finance_item.dart';
import 'package:xrpl2_plazaku/services/app_service.dart';
import 'package:xrpl2_plazaku/utils/price_format.dart';

class SellerFinancePage extends StatefulWidget {
  const SellerFinancePage({super.key});

  @override
  State<SellerFinancePage> createState() => _SellerFinancePageState();
}

class _SellerFinancePageState extends State<SellerFinancePage> {
  @override
  Widget build(BuildContext context) {
    final user = appService.userModel!;
    //get seller order
    final sellerOrders = orderService.allOrders.where((order) {
      return order.products.any(
        (element) => element.product.sellerId == user.sellerId,
      );
    }).toList();
    final finishedOrders = sellerOrders
        .where((element) => element.status == ProductStatus.finish)
        .toList();
    final totalRevenue = finishedOrders.fold(
      0,
      (sum, order) => sum + order.totalPrice,
    );
    final totalSales = finishedOrders.fold(
      0,
      (sum, order) => sum + order.totalProducts,
    );
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        title: Text('Finance'),
        backgroundColor: Color(0xFFF5F5F5),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Store Balance',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(formatRupiah(100000000), style: TextStyle(fontSize: 18)),
                  SizedBox(height: 5),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      backgroundColor: Colors.blueAccent,
                    ),
                    onPressed: () {},
                    child: Text(
                      'Withdraw Fund',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Summary',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FinanceItem(
                    title: 'Total Income',
                    value: formatRupiah(totalRevenue),
                  ),
                  FinanceItem(title: 'Total Sales', value: '$totalSales Order'),
                  FinanceItem(title: 'Fund Withdraw', value: formatRupiah(0)),
                ],
              ),
            ),
            SizedBox(height: 15),
            Text(
              'Transaction History',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            SizedBox(height: 10),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: finishedOrders.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final order = finishedOrders[index];
                return Container(
                  margin: EdgeInsets.only(bottom: 12),
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.account_balance_wallet,
                          color: Colors.blue,
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              order.userName,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 5),
                            Text(
                              DateFormat(
                                'dd MMM yyyy - HH:mm',
                              ).format(order.date),
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        '+ ${formatRupiah(order.totalPrice)}',
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
