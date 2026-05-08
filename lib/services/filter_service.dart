import 'package:xrpl2_plazaku/services/cart_service.dart';
import 'package:xrpl2_plazaku/services/product_service.dart';
import 'package:xrpl2_plazaku/services/wishlist_service.dart';

import '../models/product_model.dart';

//filter
class FilterService {
  final CartService cartService;
  final WishlistService wishlistService;
  final ProductService productService;

  FilterService(this.productService, this.wishlistService, this.cartService);

  List<ProductModel> filterByCategory(Category category) {
    return productService.products
        .where((e) => e.category == category)
        .toList();
  }
}
