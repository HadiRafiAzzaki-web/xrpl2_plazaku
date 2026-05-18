import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:xrpl2_plazaku/datas/order_data.dart';

import '../models/order_model.dart';

class OrderService {
  List<OrderModel> allOrders = orders;

  //filter orders by selected date
  List<OrderModel> getOrdersByDate(DateTimeRange? date) {
    var filtered = allOrders
        .where((element) => element.status == ProductStatus.finish)
        .toList();

    if (date != null) {
      filtered = filtered.where((element) {
        return element.date.isAfter(date.start) &&
            element.date.isBefore(date.end);
      }).toList();
    }

    return filtered;
  }

  List<OrderModel> get filteredOrdersForChart {
    //get finish order for chart
    return allOrders
        .where((order) => order.status == ProductStatus.finish)
        .toList();
  }

  //get data for chart
  Map<String, double> chartDataByDate(DateTimeRange? dateRange) {
    Map<String, double> data = {};

    var finishOrders = getOrdersByDate(dateRange);

    finishOrders.sort((a, b) => a.date.compareTo(b.date));

    for (var order in finishOrders) {
      String dateKey = DateFormat('dd/MM').format(order.date);

      data[dateKey] = (data[dateKey] ?? 0) + order.totalPrice.toDouble();
    }

    return data;
  }

  int totalOrdersByDate(DateTimeRange? dateRange) {
    return getOrdersByDate(dateRange).length;
  }

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

  //get total order according status (for see all)
  int countByStatus(ProductStatus status) {
    return allOrders.where((order) => order.status == status).length;
  }

  //get total revenue (for card in home page)
  int get totalRevenue {
    return allOrders
        .where((order) => order.status == ProductStatus.finish)
        .fold(0, (sum, item) => sum + item.totalPrice);
  }

  int totalRevenueByDate(DateTimeRange? range) {
    final orders = getOrdersByDate(range);

    return orders.fold(0, (sum, order) => sum + order.totalPrice);
  }
}
