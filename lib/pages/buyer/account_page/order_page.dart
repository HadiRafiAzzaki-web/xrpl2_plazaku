import 'package:flutter/material.dart';
import 'package:xrpl2_plazaku/pages/buyer/account_page/detail_order_page.dart';
import 'package:xrpl2_plazaku/services/app_service.dart';
import 'package:xrpl2_plazaku/widgets/order_card.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    final user = appService.userModel;
    if (user == null) {
      return Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    final userOrder = orderService.allOrders
        .where((element) => element.userId == user.id)
        .toList();
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        title: Text('Order'),
        flexibleSpace: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFFFFFFF), Color(0xFF999999)],
            ),
          ),
        ),
      ),
      body: userOrder.isEmpty
          ? Center(child: Text('You don`t have order yet'))
          : ListView.separated(
              padding: EdgeInsets.all(16),
              itemBuilder: (context, index) => OrderCard(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          DetailOrderPage(id: userOrder[index].id),
                    ),
                  );
                },
                status: userOrder[index].status,
                orderId: userOrder[index].id,
                orderDate: userOrder[index].date,
                userName: userOrder[index].userName,
                totalPrice: userOrder[index].totalPrice,
              ),
              separatorBuilder: (context, index) => SizedBox(height: 12),
              itemCount: userOrder.length,
            ),
    );
  }
}
