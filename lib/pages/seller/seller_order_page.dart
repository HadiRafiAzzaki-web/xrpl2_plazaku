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

  @override
  Widget build(BuildContext context) {
    final user = appService.userModel;
    if (user == null) {
      return Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    // get data and filter
    var orders = orderService.allOrders
        .where((element) => element.sellerId == user.sellerId)
        .toList();
    if (selectedTab != ProductStatus.all) {
      orders = orders
          .where(
            (element) =>
                element.status == selectedTab &&
                element.sellerId == user.sellerId,
          )
          .toList();
    }
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        title: Text('Order', style: TextStyle(color: Colors.blue)),
        centerTitle: true,
        backgroundColor: Color(0xFFF5F5F5),
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: Container(
            color: Color(0xFFF5F5F5),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: orderStatus.entries
                    .map(
                      (e) => TabItemNav(
                        color: Colors.blue,
                        label: e.key,
                        isActive: selectedTab == e.value,
                        onTap: () {
                          setState(() {
                            selectedTab = e.value;
                          });
                        },
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ),
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
                                DetailOrderPage(id: orders[index].id),
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
