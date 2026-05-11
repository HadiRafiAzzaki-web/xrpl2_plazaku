import 'package:xrpl2_plazaku/modeOrRole/app_mode.dart';
import 'package:xrpl2_plazaku/modeOrRole/role.dart';
import 'package:xrpl2_plazaku/models/user_model.dart';
import 'package:xrpl2_plazaku/services/order_service.dart';
import 'package:xrpl2_plazaku/services/product_service.dart';
import 'package:xrpl2_plazaku/services/sales_service.dart';
import 'package:xrpl2_plazaku/services/wishlist_service.dart';

import 'cart_service.dart';
import 'filter_service.dart';

final appService = AppService();
final productService = ProductService();
final cartService = CartService();
final wishlistService = WishlistService();
final orderService = OrderService();
final salesService = SalesService();
final filterService = FilterService(
  productService,
  wishlistService,
  cartService,
);

class AppService {
  UserModel? currentUser;

  void login(UserModel user) {
    currentUser = user;
  }

  void logout() {
    currentUser = null;
  }

  //switch between buyer and seller
  void switchMode() {
    if (currentUser == null) return;

    if (currentUser?.currentMode == AppMode.buyer) {
      currentUser?.currentMode = AppMode.seller;
    } else {
      currentUser?.currentMode = AppMode.buyer;
    }
  }

  void createStore({required String shopName}) {
    if (currentUser == null) return;

    currentUser?.sellerId = DateTime.now().millisecondsSinceEpoch;
    currentUser?.isSeller = true;
    currentUser?.role = Role.seller;
    currentUser?.shopName = shopName;
    currentUser?.currentMode = AppMode.seller;
  }
}
