import '../models/cart_model.dart';
import '../models/product_model.dart';

class CartService {
  final List<CartModel> _cart = [];

  List<CartModel> get item => _cart;

  //add product to cart cart
  void addCart({
    required String userId,
    required ProductModel product,
    required Map<String, String> variants,
  }) {
    //get index product, userId and variant
    final index = _cart.indexWhere(
      (element) =>
          element.product == product &&
          element.userId == userId &&
          _mapEquals(element.variants, variants),
    );

    //check product from cart exist or not
    if (index != -1) {
      _cart[index].quantity++;
    } else {
      _cart.add(
        CartModel(
          product: product,
          variants: Map.from(variants),
          userId: userId,
        ),
      );
    }
  }

  //user product cart
  List<CartModel> userCart(String userId) {
    return _cart.where((element) => element.userId == userId).toList();
  }

  //remove product from cart
  void removeCart(int index) {
    _cart.removeAt(index);
  }

  //get total price product
  int get totalPrice {
    return _cart.fold(
      0,
      (sum, item) => sum + item.product.price * item.quantity,
    );
  }

  //get check product total price
  int get selectedTotalPrice {
    int total = 0;

    for (var cart in item) {
      if (cart.isSelected) {
        total += cart.product.price * cart.quantity;
      }
    }

    return total;
  }

  //get product count
  int get selectedItemCount {
    return item.where((e) => e.isSelected).length;
  }

  bool _mapEquals(Map a, Map b) {
    if (a.length != b.length) {
      return false;
    }

    for (final key in a.keys) {
      if (a[key] != b[key]) {
        return false;
      }
    }

    return true;
  }
}
