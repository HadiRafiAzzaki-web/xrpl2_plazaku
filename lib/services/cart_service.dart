import 'package:flutter/foundation.dart';
import 'package:xrpl2_plazaku/models/cart_model.dart';
import 'package:xrpl2_plazaku/models/variant_model.dart';

import '../models/product_model.dart';

class CartService {
  final List<CartModel> carts = [];

  void addProductToCart(
    int userId,
    ProductModel product,
    List<VariantModel> variants,
  ) {
    final productIndex = carts.indexWhere(
      (element) =>
          element.userId == userId &&
          element.product.id == product.id &&
          listEquals(element.variants, variants),
    );
    if (productIndex != -1) {
      //add product quantity
      carts[productIndex].quantity++;
    } else {
      //make new card product to cart
      carts.add(
        CartModel(
          id: DateTime.now().millisecondsSinceEpoch,
          userId: userId,
          product: product,
          variants: List.from(variants),
        ),
      );
    }
  }

  //filter cart used userId
  List<CartModel> userCart(int userId) {
    return carts.where((element) => element.userId == userId).toList();
  }

  void removeProductFromCart(CartModel cart, int userId) {
    carts.removeWhere(
      (element) =>
          element.userId == userId &&
          element.product.id == cart.product.id &&
          listEquals(element.variants, cart.variants),
    );
  }

  int selectedProductCartPrice(int userId) {
    int total = 0;
    userCart(userId).forEach((element) {
      if (element.isSelected) {
        total += element.product.price * element.quantity;
      }
    });
    return total;
  }

  int selectedProductCartCount(int userId) {
    return userCart(userId).where((element) => element.isSelected).length;
  }
}
