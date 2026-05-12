import 'package:xrpl2_plazaku/models/product_model.dart';

class ProductQuantityModel {
  final ProductModel product;
  int quantity;

  ProductQuantityModel({required this.product, required this.quantity});

  int get subtotal {
    return product.price * quantity;
  }
}
