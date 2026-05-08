import 'package:flutter/material.dart';
import 'package:xrpl2_plazaku/modeOrRole/app_mode.dart';
import 'package:xrpl2_plazaku/modeOrRole/role.dart';
import 'package:xrpl2_plazaku/pages/admin/admin_home_page.dart';
import 'package:xrpl2_plazaku/pages/buyer/home_page.dart';
import 'package:xrpl2_plazaku/pages/seller/seller_home_page.dart';
import 'package:xrpl2_plazaku/services/app_service.dart';

class MainDashboardPage extends StatefulWidget {
  const MainDashboardPage({super.key});

  @override
  State<MainDashboardPage> createState() => _MainDashboardPageState();
}

class _MainDashboardPageState extends State<MainDashboardPage> {
  @override
  Widget build(BuildContext context) {
    final user = appService.currentUser!;

    if (user.currentMode == AppMode.seller) {
      return SellerHomePage();
    }

    if (user.role == Role.admin) {
      return AdminHomePage();
    }
    return HomePage();
  }
}
