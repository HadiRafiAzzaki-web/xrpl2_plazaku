import 'package:xrpl2_plazaku/models/delivery_method_model.dart';
import 'package:xrpl2_plazaku/models/payment_method_model.dart';
import 'package:xrpl2_plazaku/models/product_model.dart';

enum StoreStatus { waiting, verified, rejected }

class StoreModel {
  final int id;
  final int userId;
  final String shopName;
  final String shopUsername;
  final String shopLogo;
  final Category category;
  final String address;
  final String phoneNum;
  final String emailStore;
  final String storeDescription;
  final PaymentMethod paymentMethod;
  final DeliveryMethod deliveryMethod;
  final List<ProductModel>? products;
  final StoreStatus status;

  StoreModel({
    required this.shopUsername,
    required this.status,
    required this.deliveryMethod,
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
