import 'package:xrpl2_plazaku/modeOrRole/app_mode.dart';
import 'package:xrpl2_plazaku/modeOrRole/role.dart';

import '../models/user_model.dart';

//save users account
List<UserModel> users = [
  UserModel(
    username: 'Hadi',
    email: 'rafirofu4@gmail.com',
    password: 'tytyty',
    isSeller: false,
    role: Role.admin,
    currentMode: AppMode.admin,
  ),
  UserModel(
    username: 'Merlin',
    email: 'rafirofu2@gmail.com',
    password: 'rerere',
    isSeller: false,
    role: Role.buyer,
    currentMode: AppMode.buyer,
  ),
  UserModel(
    username: 'Rafi',
    email: 'rafirofu1@gmail.com',
    password: 'rarara',
    isSeller: true,
    role: Role.seller,
    currentMode: AppMode.seller,
    shopName: 'Rafi Store',
  ),
];
