import 'package:xrpl2_plazaku/modeOrRole/app_mode.dart';
import 'package:xrpl2_plazaku/modeOrRole/role.dart';

class UserModel {
  String username;
  String email;
  String password;
  String? imageProfile;
  String? shopName;
  String? shopImage;
  bool isSeller;
  Role role;
  AppMode currentMode;

  UserModel({
    required this.isSeller,
    required this.username,
    required this.email,
    required this.password,
    required this.role,
    required this.currentMode,
    this.imageProfile,
    this.shopImage,
    this.shopName,
  });
}
