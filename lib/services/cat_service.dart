import 'package:flutter/material.dart';
import 'package:xrpl2_plazaku/models/cat_model.dart';
import 'package:xrpl2_plazaku/pages/buyer/account_page/location_page.dart';
import 'package:xrpl2_plazaku/pages/buyer/account_page/myProfile.dart';
import 'package:xrpl2_plazaku/pages/buyer/account_page/order_page.dart';
import 'package:xrpl2_plazaku/pages/create_store/create_store_page.dart';
import 'package:xrpl2_plazaku/pages/main_dashboard_page.dart';
import 'package:xrpl2_plazaku/services/app_service.dart';

List<CatModel> get mod {
  return [
    CatModel(
      text: 'My profile',
      color: Colors.black,
      icon: Icons.person,
      page: Myprofile(),
    ),
    CatModel(
      text: 'Location',
      color: Colors.black,
      icon: Icons.location_on_outlined,
      page: LocationPage(),
    ),
    CatModel(
      text: 'My Order',
      color: Colors.black,
      icon: Icons.shopping_bag,
      page: OrderPage(),
    ),
    CatModel(
      text: 'My Card',
      color: Colors.black,
      icon: Icons.credit_card,
      page: Center(),
    ),
    CatModel(
      text: 'Settings',
      color: Colors.black,
      icon: Icons.settings_outlined,
      page: Center(),
    ),
    if (appService.userModel?.isSeller == true)
      CatModel(
        text: 'Switch to Seller/Buyer',
        color: Colors.black,
        icon: Icons.sell_outlined,
        page: MainDashboardPage(),
      ),
    if (appService.userModel?.isSeller == false)
      CatModel(
        text: 'Start Selling',
        color: Colors.black,
        icon: Icons.sell_outlined,
        page: CreateStorePage(),
      ),
  ];
}
