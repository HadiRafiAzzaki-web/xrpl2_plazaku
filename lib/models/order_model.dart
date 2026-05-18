import 'package:xrpl2_plazaku/models/payment_method_model.dart';
import 'package:xrpl2_plazaku/models/product_quantity_model.dart';

enum ProductStatus { all, pending, processed, sent, finish, rejected }

class OrderModel {
  final int id;
  final int userId;
  final String userName;
  final String location;
  final List<ProductQuantityModel> items;
  final PaymentMethodModel paymentMethod;
  ProductStatus status;
  final DateTime date;

  OrderModel({
    required this.paymentMethod,
    required this.location,
    required this.id,
    required this.userId,
    required this.userName,
    required this.items,
    required this.status,
    required this.date,
  });

  //get total price
  int get totalPrice {
    return items.fold(0, (sum, item) => sum + item.subtotal);
  }

  //get all product quantity
  int get totalItem {
    return items.fold(0, (sum, item) => sum + item.quantity);
  }
}
