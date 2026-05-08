import '../models/cart_model.dart';
import '../models/product_model.dart';

class CartService {
  final List<CartModel> _cart = [];

  List<CartModel> get item => _cart;

  void addCart({
    required ProductModel product,
    required Map<String, String> variants,
  }) {
    final index = _cart.indexWhere(
      (element) =>
          element.product == product && _mapEquals(element.variants, variants),
    );

    if (index != -1) {
      _cart[index].quantity++;
    } else {
      _cart.add(CartModel(product: product, variants: Map.from(variants)));
    }
  }

  void removeCart(int index) {
    _cart.removeAt(index);
  }

  int get totalPrice {
    return _cart.fold(
      0,
      (sum, item) => sum + item.product.price * item.quantity,
    );
  }

  int get selectedTotalPrice {
    int total = 0;

    for (var cart in item) {
      if (cart.isSelected) {
        total += cart.product.price * cart.quantity;
      }
    }

    return total;
  }

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
