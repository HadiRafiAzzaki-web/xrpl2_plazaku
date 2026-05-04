import 'package:xrpl2_plazaku/services/product_service.dart';

import '../models/product_model.dart';

//filter
class FilterService {
  final ProductService productService;

  FilterService(this.productService);

  List<ProductModel> filterByCategory(Category category) {
    return productService.products
        .where((e) => e.category == category)
        .toList();
  }
}
