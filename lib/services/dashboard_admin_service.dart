import 'package:flutter/material.dart';
import 'package:xrpl2_plazaku/models/dasbhoard_admin_model.dart';
import 'package:xrpl2_plazaku/pages/admin/admin_home_page.dart';

List<DasbhoardAdminModel> dashboardd = [
  DasbhoardAdminModel(
    text: 'Home',
    color: Colors.white,
    icon: Icons.home,
    page: AdminHomePage(),
  ),
  DasbhoardAdminModel(
    text: "Pengguna",
    color: Colors.white,
    icon: Icons.person,
    page: Center(),
  ),
  DasbhoardAdminModel(
    text: "Seller",
    color: Colors.white,
    icon: Icons.add_business_outlined,
    page: Center(),
  ),
  DasbhoardAdminModel(
    text: "Product",
    color: Colors.white,
    icon: Icons.business_center_outlined,
    page: Center(),
  ),
  DasbhoardAdminModel(
    text: "Pesanan",
    color: Colors.white,
    icon: Icons.rectangle,
    page: Center(),
  ),
  DasbhoardAdminModel(
    text: "Transaksi",
    color: Colors.white,
    icon: Icons.attach_money_outlined,
    page: Center(),
  ),
  DasbhoardAdminModel(
    text: "laporan",
    color: Colors.white,
    icon: Icons.info_outline,
    page: Center(),
  ),
  DasbhoardAdminModel(
    text: "Promo & Diskon",
    color: Colors.white,
    icon: Icons.discount,
    page: Center(),
  ),
  DasbhoardAdminModel(
    text: "Verivikasi",
    color: Colors.white,
    icon: Icons.verified_outlined,
    page: Center(),
  ),
  DasbhoardAdminModel(
    text: "Pengaturan",
    color: Colors.white,
    icon: Icons.settings_outlined,
    page: Center(),
  ),
  DasbhoardAdminModel(
    text: "Log Aktivitas",
    color: Colors.white,
    icon: Icons.access_time_filled_outlined,
    page: Center(),
  ),
];
