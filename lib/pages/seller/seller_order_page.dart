import 'package:flutter/material.dart';
import 'package:xrpl2_plazaku/models/order_model.dart';
import 'package:xrpl2_plazaku/pages/seller/detail_order_page.dart';
import 'package:xrpl2_plazaku/services/app_service.dart';
import 'package:xrpl2_plazaku/widgets/seller_order_card.dart';
import 'package:xrpl2_plazaku/widgets/tab_item_nav.dart';

class SellerOrderPage extends StatefulWidget {
  const SellerOrderPage({super.key});

  @override
  State<SellerOrderPage> createState() => _SellerOrderPageState();
}

class _SellerOrderPageState extends State<SellerOrderPage> {
  ProductStatus selectedTab = ProductStatus.all;
  final List<ProductStatus> tabs = [
    ProductStatus.all,
    ProductStatus.pending,
    ProductStatus.processed,
    ProductStatus.sent,
    ProductStatus.finish,
    ProductStatus.rejected,
  ];

  @override
  Widget build(BuildContext context) {
    // get data and filter
    var orders = orderService.allOrders;
    if (selectedTab != ProductStatus.all) {
      orders = orders
          .where((element) => element.status == selectedTab)
          .toList();
    }
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        title: Container(
          color: Color(0xFFF5F5F5),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: tabs
                  .map(
                    (e) => TabItemNav(
                      label: e,
                      isActive: selectedTab == e,
                      onTap: () {
                        setState(() {
                          selectedTab = e;
                        });
                      },
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
        backgroundColor: Color(0xFFF5F5F5),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            orders.isEmpty
                ? Center(child: Text('Order empty'))
                : ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.all(16),
                    itemCount: orders.length,
                    separatorBuilder: (context, index) => SizedBox(height: 12),
                    itemBuilder: (context, index) => SellerOrderCard(
                      order: orders[index],
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DetailOrderPage(orders: orders[index]),
                          ),
                        ).then((value) {
                          setState(() {});
                        });
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
