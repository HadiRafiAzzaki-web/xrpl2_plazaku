import 'package:xrpl2_plazaku/models/product_model.dart';

enum ProductStatus { all, pending, processed, sent, finish, rejected }

class OrderModel {
  final int id;
  final int userId;
  final String userName;
  String location;
  final List<ProductModel> items;
  final int totalPrice;
  final int totalAmount;
  ProductStatus status;
  final DateTime date;

  OrderModel({
    required this.location,
    required this.totalPrice,
    required this.id,
    required this.userId,
    required this.userName,
    required this.items,
    required this.totalAmount,
    required this.status,
    required this.date,
  });
}
