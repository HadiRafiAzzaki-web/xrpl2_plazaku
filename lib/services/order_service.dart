import 'package:xrpl2_plazaku/datas/order_data.dart';

import '../models/order_model.dart';

class OrderService {
  List<OrderModel> allOrders = orders;

  //get total sales from finish status
  int get totalSales {
    return allOrders
        .where((order) => order.status == ProductStatus.finish)
        .fold(
          0,
          (previousValue, element) =>
              previousValue +
              element.items.fold(
                0,
                (previousValue, element) => previousValue + element.quantity,
              ),
        );
  }

  //get total order according status
  int countByStatus(ProductStatus status) {
    return allOrders.where((order) => order.status == status).length;
  }

  //get total revenue (for card in home page)
  int get totalRevenue {
    return allOrders
        .where((order) => order.status == ProductStatus.finish)
        .fold(0, (sum, item) => sum + item.totalPrice);
  }
}
