import '../models/product_model.dart';

class WishlistService {
  final List<ProductModel> _wishlist = [];

  List<ProductModel> get items => _wishlist;

  //add product to wishlist
  void addWishlist(ProductModel product) {
    product.isFavorite = !product.isFavorite;

    if (product.isFavorite) {
      _wishlist.add(product);
    }
  }

  //remove product from wishlist
  void removeWishlist(ProductModel product) {
    product.isFavorite = false;

    if (product.isFavorite == false) {
      _wishlist.remove(product);
    }
  }

  bool isFavorite(ProductModel product) {
    return _wishlist.contains(product);
  }
}
