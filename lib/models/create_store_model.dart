import 'dart:io';

import 'package:xrpl2_plazaku/models/delivery_method_model.dart';
import 'package:xrpl2_plazaku/models/payment_method_model.dart';
import 'package:xrpl2_plazaku/models/product_model.dart';

class CreateStoreModel {
  String shopName;
  Category? category;
  String shopAddress;
  String shopDescription;
  String shopPhoneNum;
  String shopEmail;
  File? shopLogo;
  String shopUsername;
  PaymentMethod? paymentMethod;
  DeliveryMethod? deliveryMethod;
  File? idCard;
  File? selfie;
  File? tin;

  CreateStoreModel({
    this.shopName = '',
    this.category,
    this.shopAddress = '',
    this.shopPhoneNum = '',
    this.shopEmail = '',
    this.shopDescription = '',
    this.shopLogo,
    this.paymentMethod,
    this.deliveryMethod,
    this.shopUsername = '',
    this.idCard,
    this.selfie,
    this.tin,
  });
}
