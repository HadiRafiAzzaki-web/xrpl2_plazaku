import 'package:xrpl2_plazaku/modeOrRole/app_mode.dart';
import 'package:xrpl2_plazaku/modeOrRole/role.dart';

import '../models/user_model.dart';

//save users account
List<UserModel> users = [
  UserModel(
    id: 0,
    username: 'Hadi',
    email: 'rafirofu4@gmail.com',
    password: 'tytyty',
    isSeller: false,
    role: Role.admin,
    currentMode: AppMode.admin,
    location: 'Malang',
    phoneNum: '085649910168',
  ),
  UserModel(
    id: 1,
    username: 'Merlin',
    email: 'rafirofu2@gmail.com',
    password: 'rerere',
    isSeller: false,
    role: Role.buyer,
    currentMode: AppMode.buyer,
    location: 'Jakarta',
    phoneNum: '074562537647',
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
    phoneNum: '086325247353',
  ),
  UserModel(
    username: "Deni",
    email: "Denuno@gmail.com",
    password: 'helppp',
    currentMode: AppMode.admin,
    id: 3,
    isSeller: false,
    role: Role.admin,
    sellerId: 1,
    location: 'Semarang',
    phoneNum: '036272538364',
  ),
  UserModel(
    id: 4,
    sellerId: 1,
    isSeller: true,
    username: 'pipi',
    email: 'pipi@gmail.ccom',
    password: 'qwertyuiop',
    role: Role.seller,
    currentMode: AppMode.buyer,
    location: 'Bali',
    phoneNum: '083662738263',
  ),
];
