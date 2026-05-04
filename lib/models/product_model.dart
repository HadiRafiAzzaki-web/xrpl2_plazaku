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
  final String title;
  final int price;
  final String image;
  final double rating;
  final int review;
  final Category category;
  final String location;
  final List<VariantModel> variants;
  bool isFavorite = false;

  ProductModel({
    required this.isFavorite,
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
