import '../models/category_model.dart';
import '../models/product_model.dart';

List<CategoryModel> categories = [
  CategoryModel(
    label: 'Fashion',
    iconImage: 'assets/images/fashion.png',
    category: Category.fashion,
  ),
  CategoryModel(
    label: 'Smartphone & Tablet',
    iconImage: 'assets/images/smartphone-and-tablet.png',
    category: Category.smartphoneTablet,
  ),
  CategoryModel(
    label: 'Otomotif',
    iconImage: 'assets/images/otomotif.png',
    category: Category.otomotif,
  ),
  CategoryModel(
    label: 'Sport',
    iconImage: 'assets/images/sport.png',
    category: Category.sport,
  ),
  CategoryModel(
    label: 'Food',
    iconImage: 'assets/images/food.png',
    category: Category.food,
  ),
  CategoryModel(
    label: 'Voucher Game',
    iconImage: 'assets/images/voucher-game.png',
    category: Category.voucherGame,
  ),
  CategoryModel(
    label: 'Electronic',
    iconImage: 'assets/images/electronic.png',
    category: Category.electronic,
  ),
  CategoryModel(
    label: 'Health & Care',
    iconImage: 'assets/images/health-and-care.png',
    category: Category.healthCare,
  ),
];
