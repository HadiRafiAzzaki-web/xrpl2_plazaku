import 'package:xrpl2_plazaku/datas/order_data.dart';

import '../models/order_model.dart';

class OrderService {
  List<OrderModel> allOrders = orders;

  List<OrderModel> sellerOrders(int? sellerId) {
    return allOrders
        .where(
          (element) => element.products.any(
            (element) => element.product.sellerId == sellerId,
          ),
        )
        .toList();
  }

  //get total sales from finish status
  int totalSales(int? sellerId) {
    return sellerOrders(sellerId)
        .where(
          (element) =>
              element.status == ProductStatus.finish &&
              element.sellerId == sellerId,
        )
        .fold(
          0,
          (previousValue, element) =>
              previousValue +
              element.products
                  .where((element) => element.product.sellerId == sellerId)
                  .fold(
                    0,
                    (previousValue, element) =>
                        previousValue + element.quantity,
                  ),
        );
  }

  //get total order according status
  int countByStatus(ProductStatus status, int? sellerId) {
    return allOrders
        .where((order) => order.status == status && order.sellerId == sellerId)
        .length;
  }

  //get total revenue (for card in home page)
  int totalRevenue(int? sellerId) {
    return sellerOrders(sellerId)
        .where(
          (element) =>
              element.status == ProductStatus.finish &&
              element.sellerId == sellerId,
        )
        .fold(
          0,
          (previousValue, element) => previousValue + element.totalPrice,
        );
  }
}
