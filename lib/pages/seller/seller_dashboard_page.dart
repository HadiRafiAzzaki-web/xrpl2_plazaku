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
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white70,
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
            icon: Icon(
              Icons.home,
              color: Colors.white,
              shadows: [BoxShadow(color: Colors.black)],
              size: 35,
            ),
            label: 'Home',
            activeIcon: Icon(Icons.home, color: Colors.black, size: 50),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_bag,
              color: Colors.white,
              shadows: [BoxShadow(color: Colors.black)],
              size: 35,
            ),
            label: 'Product',
            activeIcon: Icon(Icons.shopping_bag, color: Colors.black, size: 50),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.white,
              shadows: [BoxShadow(color: Colors.black)],
              size: 35,
            ),
            label: 'Order',
            activeIcon: Icon(
              Icons.shopping_cart,
              color: Colors.black,
              size: 50,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.money,
              color: Colors.white,
              shadows: [BoxShadow(color: Colors.black)],
              size: 35,
            ),
            label: 'Finance',
            activeIcon: Icon(Icons.money, color: Colors.black, size: 50),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: Colors.white,
              shadows: [BoxShadow(color: Colors.black)],
              size: 35,
            ),
            label: 'Account',
            activeIcon: Icon(Icons.person, color: Colors.black, size: 50),
          ),
        ],
      ),
      body: pages[selectedIndex],
    );
  }
}
