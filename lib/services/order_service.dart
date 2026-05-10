import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:xrpl2_plazaku/services/app_service.dart';

import '../models/order_model.dart';

class OrderService {
  List<OrderModel> allOrders = [
    OrderModel(
      id: '#INV/2405/00123',
      userId: 'user_01',
      userName: 'Dika Maulana',
      items: [productService.products[0], productService.products[3]],
      totalAmount: 463000,
      status: 'Finish',
      date: DateTime.now().subtract(const Duration(hours: 2)),
      totalPrice: 463000,
    ),
    OrderModel(
      id: '#INV/2405/00122',
      userId: 'user_02',
      userName: 'Siti Aisyah',
      items: [productService.products[0], productService.products[3]],
      totalAmount: 199000,
      status: 'Finish',
      date: DateTime.now().subtract(const Duration(days: 1)),
      totalPrice: 463000,
    ),
    OrderModel(
      id: '#INV/2405/00121',
      userId: 'user_03',
      userName: 'Budi Santoso',
      items: [productService.products[0], productService.products[3]],
      totalAmount: 750000,
      status: 'Finish',
      date: DateTime.now().subtract(const Duration(days: 2)),
      totalPrice: 463000,
    ),
  ];

  //filter orders by selected date
  List<OrderModel> getOrdersByDate(DateTimeRange? range) {
    var orders = allOrders.where((o) => o.status == 'Finish').toList();

    if (range != null) {
      orders = orders.where((o) {
        return o.date.isAfter(range.start.subtract(const Duration(days: 1))) &&
            o.date.isBefore(range.end.add(const Duration(days: 1)));
      }).toList();
    }

    return orders;
  }

  List<OrderModel> get filteredOrdersForChart {
    //get finish order for chart
    return allOrders.where((order) => order.status == 'Finish').toList();
  }

  //get data for chart
  Map<String, double> chartDataByDate(DateTimeRange? range) {
    Map<String, double> data = {};

    var finishOrders = getOrdersByDate(range);

    finishOrders.sort((a, b) => a.date.compareTo(b.date));

    for (var order in finishOrders) {
      String dateKey = DateFormat('dd/MM').format(order.date);

      data[dateKey] = (data[dateKey] ?? 0) + order.totalAmount.toDouble();
    }

    return data;
  }

  int totalOrdersByDate(DateTimeRange? range) {
    return getOrdersByDate(range).length;
  }

  //get total sales from finish status
  int get totalSales {
    return allOrders
        .where((order) => order.status == 'Finish')
        .fold(0, (sum, order) => sum + order.items.length);
  }

  //get total order according status (for see all)
  int countByStatus(String status) {
    return allOrders.where((order) => order.status == status).length;
  }

  //get total revenue (for card in home page)
  int get totalRevenue {
    return allOrders
        .where((order) => order.status == 'Finish')
        .fold(0, (sum, item) => sum + item.totalAmount);
  }

  int totalRevenueByDate(DateTimeRange? range) {
    final orders = getOrdersByDate(range);

    return orders.fold(0, (sum, order) => sum + order.totalAmount);
  }
}

final orderService = OrderService();
