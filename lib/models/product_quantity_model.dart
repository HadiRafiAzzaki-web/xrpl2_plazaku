import 'package:xrpl2_plazaku/models/product_model.dart';
import 'package:xrpl2_plazaku/models/variant_model.dart';

class ProductQuantityModel {
  final ProductModel product;
  final List<VariantModel> variants;
  int quantity;

  ProductQuantityModel({
    required this.product,
    required this.quantity,
    required this.variants,
  });

  int get subtotal {
    return product.price * quantity;
  }
}
