import 'package:xrpl2_plazaku/models/delivery_method_model.dart';
import 'package:xrpl2_plazaku/models/payment_method_model.dart';
import 'package:xrpl2_plazaku/models/product_quantity_model.dart';

class CheckoutModel {
  final int id;
  final int userId;
  final List<ProductQuantityModel> productsQuantity;
  final String location;
  PaymentMethod paymentMethod;
  DeliveryMethod deliveryMethod;

  CheckoutModel({
    required this.id,
    required this.userId,
    required this.productsQuantity,
    required this.location,
    required this.paymentMethod,
    required this.deliveryMethod,
  });

  int get totalPrice {
    return productsQuantity.fold(0, (sum, item) => sum + item.subtotal);
  }

  int get totalItems =>
      productsQuantity.fold(0, (sum, item) => sum + item.quantity);
}
