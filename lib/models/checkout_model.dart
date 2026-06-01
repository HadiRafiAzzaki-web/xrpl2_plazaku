import 'package:xrpl2_plazaku/modeOrRole/delivery_method.dart';
import 'package:xrpl2_plazaku/modeOrRole/payment_method.dart';
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
    return productsQuantity.fold(
      0,
      (previousValue, element) => previousValue + element.subtotal,
    );
  }

  int get totalProducts {
    return productsQuantity.fold(
      0,
      (previousValue, element) => previousValue + element.quantity,
    );
  }
}
