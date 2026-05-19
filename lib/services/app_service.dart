import 'package:xrpl2_plazaku/modeOrRole/app_mode.dart';
import 'package:xrpl2_plazaku/modeOrRole/role.dart';
import 'package:xrpl2_plazaku/models/user_model.dart';
import 'package:xrpl2_plazaku/services/checkout_service.dart';
import 'package:xrpl2_plazaku/services/order_service.dart';
import 'package:xrpl2_plazaku/services/product_service.dart';
import 'package:xrpl2_plazaku/services/search_service.dart';
import 'package:xrpl2_plazaku/services/store_service.dart';
import 'package:xrpl2_plazaku/services/wishlist_service.dart';

import 'cart_service.dart';
import 'filter_service.dart';

class AppService {
  UserModel? userModel;

  void login(UserModel user) {
    userModel = user;
  }

  void logout() {
    userModel = null;
  }

  void switchBetweenBuyerSeller() {
    if (userModel == null) return;

    if (userModel?.currentMode == AppMode.buyer) {
      userModel?.currentMode = AppMode.seller;
    } else {
      userModel?.currentMode = AppMode.buyer;
    }
  }

  void createStore(String shopName) {
    userModel?.sellerId = DateTime.now().millisecondsSinceEpoch;
    userModel?.currentMode = AppMode.seller;
    userModel?.role = Role.seller;
    userModel?.isSeller = true;
    userModel?.shopName = shopName;
  }
}

final appService = AppService();
final productService = ProductService();
final cartService = CartService();
final wishlistService = WishlistService();
final orderService = OrderService();
final checkoutService = CheckoutService();
final storeService = StoreService();
final filterService = FilterService(
  productService,
  wishlistService,
  cartService,
);
final searchService = SearchService();
