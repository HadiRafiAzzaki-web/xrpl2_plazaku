import '../models/product_model.dart';
import '../models/wishlist_model.dart';

class WishlistService {
  final List<WishlistModel> _wishlist = [];

  List<WishlistModel> get items => _wishlist;

  //add wishlist
  void addWishlist({required ProductModel product, required String userId}) {
    final isExist = _wishlist.any(
      (e) => e.userId == userId && e.product.id == product.id,
    );

    if (!isExist) {
      _wishlist.add(WishlistModel(userId: userId, product: product));
      product.isFavorite = true;
    }
  }

  //remove wishlist
  void removeWishlist({required ProductModel product, required String userId}) {
    _wishlist.removeWhere(
      (e) => e.userId == userId && e.product.id == product.id,
    );
    product.isFavorite = false;
  }

  //user wishlist
  List<WishlistModel> userWishlist(String userId) {
    return _wishlist.where((e) => e.userId == userId).toList();
  }

  //check favorite
  bool isFavorite({required ProductModel product, required String userId}) {
    return _wishlist.any(
      (e) => e.userId == userId && e.product.id == product.id,
    );
  }
}
