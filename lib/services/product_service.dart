import '../datas/product_data.dart';
import '../models/product_model.dart';

class ProductService {
  List<ProductModel> products = dataProducts;

  // seller product
  List<ProductModel> sellerProducts(int? sellerId) {
    return products.where((e) => e.sellerId == sellerId).toList();
  }

  // add product
  void addProduct(ProductModel product) {
    products.add(product);
  }

  // remove product
  void removeProduct(int id) {
    products.removeWhere((e) => e.id == id);
  }
}
