import 'package:flutter/material.dart';
import 'package:xrpl2_plazaku/models/admin_setting_model.dart';

List<AdminSettingModel> set = [
  AdminSettingModel(
    text: "Info Aplikasi",
    color: Colors.white,
    icon: Icons.info_outline,
    page: Center(),
  ),
  AdminSettingModel(
    text: "Pengaturan Umum",
    color: Colors.white,
    icon: Icons.settings,
    page: Center(),
  ),
  AdminSettingModel(
    text: "Metode Pembayaran",
    color: Colors.black,
    icon: Icons.credit_card_sharp,
    page: Center(),
  ),
  AdminSettingModel(
    text: "Pengaturan Ongkir",
    color: Colors.black,
    icon: Icons.fire_truck_outlined,
    page: Center(),
  ),
  AdminSettingModel(
    text: "Notifikasi",
    color: Colors.black,
    icon: Icons.notifications_none_outlined,
    page: Center(),
  ),
  AdminSettingModel(
    text: "Keamanan",
    color: Colors.black,
    icon: Icons.security_outlined,
    page: Center(),
  ),
  AdminSettingModel(
    text: "Backup Data",
    color: Colors.black,
    icon: Icons.backup_outlined,
    page: Center(),
  ),
];
