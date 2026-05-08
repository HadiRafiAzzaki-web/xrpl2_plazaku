import 'package:flutter/material.dart';
import 'package:xrpl2_plazaku/pages/wishlist_page.dart';
import 'package:xrpl2_plazaku/services/app_service.dart';

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

  Map<int, Widget> pages = {0: HomePage(), 3: AccountPage()};

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
              if (value == 0) {
                selectedIndex = 0;
              } else if (value == 1) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WishlistPage(
                      wishlistService: wishlistService,
                      cartService: cartService,
                    ),
                  ),
                );
              } else if (value == 2) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartPage(cartService: cartService),
                  ),
                );
              } else if (value == 3) {
                selectedIndex = 3;
              }
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.white, size: 35),
              activeIcon: Icon(Icons.home, size: 50, color: Colors.black),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite, color: Colors.white, size: 35),
              activeIcon: Icon(Icons.favorite, size: 50, color: Colors.black),
              label: 'Wishlist',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart, color: Colors.white, size: 35),
              activeIcon: Icon(
                Icons.shopping_cart,
                size: 50,
                color: Colors.black,
              ),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Colors.white, size: 35),
              activeIcon: Icon(Icons.person, size: 50, color: Colors.black),
              label: 'Account',
            ),
          ],
        ),
      ),
      body: pages[selectedIndex],
    );
  }
}
