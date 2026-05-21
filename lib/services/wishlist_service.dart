import '../models/product_model.dart';
import '../models/wishlist_model.dart';

class WishlistService {
  final List<WishlistModel> wishlist = [];

  //add wishlist
  void addWishlist(ProductModel product, int userId) {
    final isExist = wishlist.any(
      (element) => element.userId == userId && element.product.id == product.id,
    );

    if (!isExist) {
      wishlist.add(WishlistModel(userId: userId, product: product));
      product.isFavorite = true;
    }
  }

  //remove wishlist
  void removeWishlist(ProductModel product, int userId) {
    wishlist.removeWhere(
      (element) => element.userId == userId && element.product.id == product.id,
    );
    product.isFavorite = false;
  }

  //user wishlist
  List<WishlistModel> userWishlist(int userId) {
    return wishlist.where((element) => element.userId == userId).toList();
  }
}
