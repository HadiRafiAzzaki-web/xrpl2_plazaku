import 'package:xrpl2_plazaku/models/product_model.dart';
import 'package:xrpl2_plazaku/models/variant_model.dart';

class CartModel {
  final int? id;
  final int userId;
  final ProductModel product;
  final List<VariantModel> variants;
  int quantity;
  bool isSelected;

  CartModel({
    this.id,
    required this.userId,
    required this.product,
    required this.variants,
    this.quantity = 1,
    this.isSelected = false,
  });
}
