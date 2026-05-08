import 'package:xrpl2_plazaku/models/product_model.dart';

class CartModel {
  final ProductModel product;
  final Map<String, String> variants;
  int quantity;
  bool isSelected;

  CartModel({
    required this.product,
    required this.variants,
    this.quantity = 1,
    this.isSelected = false,
  });
}
