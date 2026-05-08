import '../models/product_model.dart';

class WishlistService {
  final List<ProductModel> _wishlist = [];

  List<ProductModel> get items => _wishlist;

  //add product to wishlist
  void addWishlist(ProductModel product) {
    product.isFavorite = !product.isFavorite;

    final isExist = _wishlist.contains(product);

    if (!isExist) {
      _wishlist.add(product);
      product.isFavorite = true;
    }
  }

  //remove product from wishlist
  void removeWishlist(ProductModel product) {
    _wishlist.remove(product);
    product.isFavorite = false;
  }

  bool isFavorite(ProductModel product) {
    return _wishlist.contains(product);
  }
}
