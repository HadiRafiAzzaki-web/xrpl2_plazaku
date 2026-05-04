import 'package:flutter/material.dart';
import 'package:xrpl2_plazaku/pages/wishlist_page.dart';

import '../models/dashboard_model.dart';
import 'account_page.dart';
import 'cart_page.dart';
import 'home_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int selectedIndex = 0;
  Map<int, DashboardModel> navigations = {
    0: DashboardModel(label: 'Home', icon: Icons.home, page: HomePage()),
    1: DashboardModel(
      label: 'Wishlist',
      icon: Icons.favorite,
      page: WishlistPage(),
    ),
    2: DashboardModel(
      label: 'Cart',
      icon: Icons.shopping_cart,
      page: CartPage(),
    ),
    3: DashboardModel(
      label: 'Account',
      icon: Icons.person,
      page: AccountPage(),
    ),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFFFFFF), Color(0xFF999999)],
          ),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.white70,
          currentIndex: selectedIndex,
          onTap: (value) {
            setState(() {
              selectedIndex = value;
            });
          },
          items: navigations.entries
              .map(
                (e) => BottomNavigationBarItem(
                  backgroundColor: Colors.transparent,
                  icon: Icon(e.value.icon, size: 35),
                  label: e.value.label,
                  activeIcon: Icon(e.value.icon, size: 50),
                ),
              )
              .toList(),
        ),
      ),
      body: navigations[selectedIndex]!.page,
    );
  }
}
