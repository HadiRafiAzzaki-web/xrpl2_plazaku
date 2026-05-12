import 'package:flutter/material.dart';
import 'package:xrpl2_plazaku/models/cat_model.dart';
import 'package:xrpl2_plazaku/pages/myProfile.dart';
import 'package:xrpl2_plazaku/pages/splash_screen.dart';

List<CatModel> mod = [
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
    page: Center(),
  ),
  CatModel(
    text: 'My Order',
    color: Colors.black,
    icon: Icons.shopping_bag,
    page: Center(),
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
  CatModel(
    text: 'Sell Products',
    color: Colors.black,
    icon: Icons.sell_outlined,
    page: Center(),
  ),
  CatModel(
    text: 'Log Out ',
    color: Colors.black,
    icon: Icons.logout_outlined,
    page: SplashScreen(),
  ),
];