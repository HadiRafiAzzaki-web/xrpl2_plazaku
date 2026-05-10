import 'package:flutter/material.dart';
import 'package:xrpl2_plazaku/widgets/seller_order_card.dart';

import '../../services/app_service.dart';

class SellerOrderPage extends StatefulWidget {
  const SellerOrderPage({super.key});

  @override
  State<SellerOrderPage> createState() => _SellerOrderPageState();
}

class _SellerOrderPageState extends State<SellerOrderPage> {
  String selectedTab = 'All';
  final List<String> tabs = ['All', 'Pending', 'Processed', 'Sent', 'Finish'];

  @override
  Widget build(BuildContext context) {
    // get data and filter
    var orders = orderService.allOrders;
    if (selectedTab != 'All') {
      orders = orders.where((o) => o.status == selectedTab).toList();
    }

    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        title: Text(
          "Orders",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFFF5F5F5),
        elevation: 0,
      ),
      body: Column(
        children: [
          //tab navigation
          Container(
            color: Color(0xFFF5F5F5),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: tabs.map((tab) => _buildTabItem(tab)).toList(),
              ),
            ),
          ),
          Expanded(
            child: orders.isEmpty
                ? Center(child: Text('Order empty'))
                : ListView.separated(
                    padding: EdgeInsets.all(16),
                    itemCount: orders.length,
                    separatorBuilder: (context, index) => SizedBox(height: 12),
                    itemBuilder: (context, index) =>
                        SellerOrderCard(order: orders[index]),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabItem(String label) {
    bool isActive = selectedTab == label;
    return GestureDetector(
      onTap: () => setState(() => selectedTab = label),
      child: Container(
        margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          color: Color(0xFFF5F5F5),
          border: isActive
              ? const Border(bottom: BorderSide(color: Colors.blue, width: 3))
              : null,
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isActive ? Colors.blue : Colors.grey,
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
