import 'package:xrpl2_plazaku/models/product_model.dart';

class OrderModel {
  final String id;
  final String userId;
  final String userName;
  final List<ProductModel> items;
  final int totalPrice;
  final int totalAmount;
  final String status;
  final DateTime date;

  OrderModel({
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
