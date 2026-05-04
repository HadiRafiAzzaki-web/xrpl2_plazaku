import 'package:xrpl2_plazaku/services/product_service.dart';
import 'package:xrpl2_plazaku/services/wishlist_service.dart';

import 'cart_service.dart';
import 'filter_service.dart';

final productService = ProductService();
final filterService = FilterService(productService);
final cartService = CartService();
final wishlistService = WishlistService();
