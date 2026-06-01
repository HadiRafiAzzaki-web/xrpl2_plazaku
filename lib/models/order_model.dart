import 'package:xrpl2_plazaku/modeOrRole/delivery_method.dart';
import 'package:xrpl2_plazaku/modeOrRole/payment_method.dart';
import 'package:xrpl2_plazaku/models/product_quantity_model.dart';

enum ProductStatus { all, pending, processed, sent, finish, rejected }

final Map<String, ProductStatus> orderStatus = {
  'All': ProductStatus.all,
  'Pending': ProductStatus.pending,
  'Processed': ProductStatus.processed,
  'Sent': ProductStatus.sent,
  'Finish': ProductStatus.finish,
  'Rejected': ProductStatus.rejected,
};

class OrderModel {
  final int id;
  final int userId;
  final int? sellerId;
  final String userName;
  final String location;
  final List<ProductQuantityModel> products;
  final PaymentMethod paymentMethod;
  final DeliveryMethod deliveryMethod;
  ProductStatus status;
  final DateTime date;

  OrderModel({
    required this.deliveryMethod,
    required this.paymentMethod,
    required this.location,
    required this.id,
    required this.sellerId,
    required this.userId,
    required this.userName,
    required this.products,
    required this.status,
    required this.date,
  });

  //get total price
  int get totalPrice {
    return products.fold(
      0,
      (previousValue, element) => previousValue + element.subtotal,
    );
  }

  //get all product quantity
  int get totalProducts {
    return products.fold(
      0,
      (previousValue, element) => previousValue + element.quantity,
    );
  }
}
