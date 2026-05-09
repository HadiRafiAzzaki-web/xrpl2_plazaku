import 'package:flutter/material.dart';
import 'package:xrpl2_plazaku/pages/seller/seller_account_page.dart';
import 'package:xrpl2_plazaku/pages/seller/seller_finance_page.dart';
import 'package:xrpl2_plazaku/pages/seller/seller_home_page.dart';
import 'package:xrpl2_plazaku/pages/seller/seller_order_page.dart';
import 'package:xrpl2_plazaku/pages/seller/seller_product_page.dart';

class SellerDashboardPage extends StatefulWidget {
  const SellerDashboardPage({super.key});

  @override
  State<SellerDashboardPage> createState() => _SellerDashboardPageState();
}

class _SellerDashboardPageState extends State<SellerDashboardPage> {
  int selectedIndex = 0;

  Map<int, Widget> pages = {
    0: SellerHomePage(),
    2: SellerOrderPage(),
    3: SellerFinancePage(),
    4: SellerAccountPage(),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        showUnselectedLabels: true,
        selectedLabelStyle: TextStyle(
          color: Colors.blue,
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelStyle: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          setState(() {
            if (value == 0) {
              selectedIndex = 0;
            } else if (value == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SellerProductPage()),
              );
            } else if (value == 2) {
              selectedIndex = 2;
            } else if (value == 3) {
              selectedIndex = 3;
            } else if (value == 4) {
              selectedIndex = 4;
            }
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 30),
            activeIcon: Icon(Icons.home, size: 35),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag, size: 30),
            activeIcon: Icon(Icons.shopping_bag, size: 35),
            label: 'Product',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart, size: 30),
            activeIcon: Icon(Icons.shopping_cart, size: 35),
            label: 'Order',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.money, size: 30),
            activeIcon: Icon(Icons.money, size: 35),
            label: 'Finance',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 30),
            activeIcon: Icon(Icons.person, size: 35),
            label: 'Account',
          ),
        ],
      ),
      body: pages[selectedIndex],
    );
  }
}
