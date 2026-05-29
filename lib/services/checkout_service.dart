import 'package:xrpl2_plazaku/models/checkout_model.dart';
import 'package:xrpl2_plazaku/models/order_model.dart';
import 'package:xrpl2_plazaku/services/app_service.dart';

class CheckoutService {
  List<CheckoutModel> checkouts = [];

  void addCheckouts(CheckoutModel checkout, int userId) {
    final productIndex = checkouts.indexWhere(
      (element) => element.id == checkout.id && element.userId == userId,
    );

    if (productIndex == -1) {
      checkouts.add(
        CheckoutModel(
          id: checkout.id,
          userId: userId,
          productsQuantity: checkout.productsQuantity,
          location: checkout.location,
          paymentMethod: checkout.paymentMethod,
          deliveryMethod: checkout.deliveryMethod,
        ),
      );
    }
  }

  OrderModel createOrder(CheckoutModel checkout, int userId) {
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
      sellerId: checkout.productsQuantity.first.product.sellerId,
      deliveryMethod: checkout.deliveryMethod,
    );
    return order;
  }
}
