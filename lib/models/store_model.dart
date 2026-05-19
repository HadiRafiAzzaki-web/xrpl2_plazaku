import 'package:xrpl2_plazaku/models/payment_method_model.dart';
import 'package:xrpl2_plazaku/models/product_model.dart';

class StoreModel {
  final int id;
  final int userId;
  final String shopName;
  final String shopLogo;
  final Category category;
  final String address;
  final String phoneNum;
  final String emailStore;
  final String storeDescription;
  final PaymentMethodModel paymentMethod;
  final List<ProductModel>? products;

  StoreModel({
    required this.paymentMethod,
    required this.address,
    required this.emailStore,
    required this.phoneNum,
    required this.storeDescription,
    required this.category,
    required this.id,
    required this.userId,
    required this.shopName,
    required this.shopLogo,
    this.products,
  });
}
