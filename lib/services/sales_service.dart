import 'package:flutter/material.dart';
import 'package:xrpl2_plazaku/models/sales_model.dart';

class SalesService {
  final List<SalesModel> sales = [
    SalesModel(total: 200000, date: DateTime(2026, 5, 1)),

    SalesModel(total: 500000, date: DateTime(2026, 5, 10)),

    SalesModel(total: 700000, date: DateTime(2026, 6, 1)),
  ];

  List<SalesModel> filterSales(DateTimeRange? selectedDate) {
    if (selectedDate == null) {
      return sales;
    }
    return sales.where((sale) {
      return sale.date.isAfter(
            selectedDate.start.subtract(Duration(days: 1)),
          ) &&
          sale.date.isBefore(selectedDate.end.add(Duration(days: 1)));
    }).toList();
  }

  int totalSales(DateTimeRange? selectedDate) {
    final filtered = filterSales(selectedDate);

    return filtered.fold(0, (sum, item) => sum + item.total);
  }
}
