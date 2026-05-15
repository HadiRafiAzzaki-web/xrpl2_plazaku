import 'package:xrpl2_plazaku/models/checkout_model.dart';
import 'package:xrpl2_plazaku/models/order_model.dart';
import 'package:xrpl2_plazaku/services/app_service.dart';

class CheckoutService {
  OrderModel createOrder(CheckoutModel checkout) {
    if (checkout.productsQuantity.isEmpty) {
      throw Exception('Cart empty');
    }
    final order = OrderModel(
      paymentMethod: checkout.paymentMethod,
      location: checkout.location,
      id: DateTime.now().millisecondsSinceEpoch,
      userId: checkout.userId,
      userName: appService.userModel!.username,
      items: checkout.productsQuantity,
      status: ProductStatus.pending,
      date: DateTime.now(),
    );
    return order;
  }
}
