import 'package:flutter/material.dart';
import 'package:xrpl2_plazaku/datas/order_data.dart';

import '../models/order_model.dart';

class OrderService {
  List<OrderModel> allOrders = orders;

  List<OrderModel> sellerOrders(int? sellerId) {
    return allOrders
        .where(
          (element) => element.items.any(
            (element) => element.product.sellerId == sellerId,
          ),
        )
        .toList();
  }

  List<OrderModel> orderFilteredByDate(int? sellerId, DateTimeRange? date) {
    if (date == null) return sellerOrders(sellerId);
    final start = DateTime(date.start.year, date.start.month, date.start.day);
    final end = DateTime(
      date.end.year,
      date.end.month,
      date.end.day,
      23,
      59,
      59,
    );
    return sellerOrders(sellerId).where((element) {
      return element.date.isAfter(start.subtract(Duration(seconds: 1))) &&
          element.date.isBefore(end.add(Duration(seconds: 1)));
    }).toList();
  }

  //get total sales from finish status
  int totalSales(int? sellerId, DateTimeRange? date) {
    return orderFilteredByDate(sellerId, date)
        .where(
          (element) =>
              element.status == ProductStatus.finish &&
              element.sellerId == sellerId,
        )
        .fold(
          0,
          (previousValue, element) =>
              previousValue +
              element.items
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
  int totalRevenue(int? sellerId, DateTimeRange? date) {
    return orderFilteredByDate(sellerId, date)
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
