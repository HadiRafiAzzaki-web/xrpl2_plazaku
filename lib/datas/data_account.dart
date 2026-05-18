import 'package:xrpl2_plazaku/modeOrRole/app_mode.dart';
import 'package:xrpl2_plazaku/modeOrRole/role.dart';

import '../models/user_model.dart';

//save users account
List<UserModel> users = [
  UserModel(
    id: 0,
    sellerId: null,
    username: 'Hadi',
    email: 'rafirofu4@gmail.com',
    password: 'tytyty',
    isSeller: false,
    role: Role.admin,
    currentMode: AppMode.admin,
    location: 'Malang',
  ),
  UserModel(
    id: 1,
    sellerId: null,
    username: 'Merlin',
    email: 'rafirofu2@gmail.com',
    password: 'rerere',
    isSeller: false,
    role: Role.buyer,
    currentMode: AppMode.buyer,
    location: 'Jakarta',
  ),
  UserModel(
    id: 2,
    sellerId: 0,
    username: 'Rafi',
    email: 'rafirofu1@gmail.com',
    password: 'rarara',
    isSeller: true,
    role: Role.seller,
    currentMode: AppMode.seller,
    shopName: 'Rafi Store',
    location: 'Medan',
  ),
  UserModel(
    username: "Deni",
    email: "Denuno@gmail.com",
    password: 'helpme',
    currentMode: AppMode.seller,
    id: 3,
    isSeller: false,
    role: Role.seller,
    sellerId: null,
    location: 'Semarang',
  ),
];
