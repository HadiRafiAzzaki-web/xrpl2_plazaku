import 'package:flutter/material.dart';
import 'package:xrpl2_plazaku/modeOrRole/app_mode.dart';
import 'package:xrpl2_plazaku/modeOrRole/role.dart';
import 'package:xrpl2_plazaku/pages/admin/admin_dashboard_page.dart';
import 'package:xrpl2_plazaku/pages/buyer/dashboard_page.dart';
import 'package:xrpl2_plazaku/pages/seller/seller_dashboard_page.dart';
import 'package:xrpl2_plazaku/services/app_service.dart';

class MainDashboardPage extends StatelessWidget {
  const MainDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: appService,
      builder: (context, _) {
        final user = appService.userModel;
        if (user == null) {
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        }

        if (user.role == Role.admin) {
          return AdminDashboardPage();
        }

        if (user.role == Role.seller && user.currentMode == AppMode.seller) {
          return SellerDashboardPage();
        }

        return DashboardPage();
      },
    );
  }
}
