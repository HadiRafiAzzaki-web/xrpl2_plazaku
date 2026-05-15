import '../models/product_model.dart';
import '../models/wishlist_model.dart';

class WishlistService {
  final List<WishlistModel> wishlist = [];

  //add wishlist
  void addWishlist(ProductModel product, int userId) {
    final isExist = wishlist.any(
      (e) => e.userId == userId && e.product.id == product.id,
    );

    if (!isExist) {
      wishlist.add(WishlistModel(userId: userId, product: product));
      product.isFavorite = true;
    }
  }

  //remove wishlist
  void removeWishlist(ProductModel product, int userId) {
    wishlist.removeWhere(
      (e) => e.userId == userId && e.product.id == product.id,
    );
    product.isFavorite = false;
  }

  //user wishlist
  List<WishlistModel> userWishlist(int userId) {
    return wishlist.where((e) => e.userId == userId).toList();
  }

  //check favorite
  bool isFavorite(ProductModel product, int userId) {
    return wishlist.any(
      (e) => e.userId == userId && e.product.id == product.id,
    );
  }
}
