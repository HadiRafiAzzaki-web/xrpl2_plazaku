import 'package:xrpl2_plazaku/models/variant_model.dart';

//product by category
enum Category {
  fashion,
  smartphoneTablet,
  otomotif,
  sport,
  food,
  voucherGame,
  electronic,
  healthCare,
}

class ProductModel {
  final int id;
  final String sellerId;
  final int stock;
  final String title;
  final int price;
  final String image;
  final double rating;
  final int review;
  final Category category;
  final String location;
  final List<VariantModel> variants;

  bool isFavorite;
  bool isChosenCart;

  ProductModel(
    this.id,
    this.sellerId,
    this.stock, {
    this.isChosenCart = false,
    this.isFavorite = false,
    required this.location,
    required this.category,
    required this.title,
    required this.price,
    required this.image,
    required this.rating,
    required this.review,
    required this.variants,
  });
}
