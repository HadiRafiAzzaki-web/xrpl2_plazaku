import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../datas/order_data.dart';
import '../../../models/order_model.dart';

class AdminSellerChart extends StatelessWidget {
  final DateTimeRange? date;

  const AdminSellerChart({super.key, this.date});

  @override
  Widget build(BuildContext context) {
    List<OrderModel> filteredOrder() {
      if (date == null) {
        return orders;
      }
      final start = DateTime(
        date!.start.year,
        date!.start.month,
        date!.start.day,
      );

      final end = DateTime(
        date!.end.year,
        date!.end.month,
        date!.end.day,
        23,
        59,
        59,
      );
      return orders.where((element) {
        return element.date.isAfter(
              start.subtract(const Duration(seconds: 1)),
            ) &&
            element.date.isBefore(end.add(const Duration(seconds: 1)));
      }).toList();
    }

    final filteredOrders = filteredOrder();

    final Map<String, int> groupedData = {};

    for (var order in filteredOrders) {
      groupedData['${order.date.day}/${order.date.month}'] =
          (groupedData['${order.date.day}/${order.date.month}'] ?? 0) + 1;
    }

    final labels = groupedData.keys.toList();
    final values = groupedData.values.toList();
    return BarChart(
      BarChartData(
        maxY: values.isEmpty
            ? 1
            : values
                      .reduce(
                        (value, element) => value > element ? value : element,
                      )
                      .toDouble() +
                  1,
        borderData: FlBorderData(show: false),
        gridData: FlGridData(show: true, drawVerticalLine: false),
        titlesData: FlTitlesData(
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                if (value.toInt() >= labels.length) {
                  return SizedBox();
                }
                return Text(
                  labels[value.toInt()],
                  style: TextStyle(fontSize: 12),
                );
              },
            ),
          ),
        ),
        barGroups: List.generate(
          groupedData.values.length,
          (index) => BarChartGroupData(
            x: index,
            barRods: [
              BarChartRodData(
                toY: values[index].toDouble(),
                width: 18,
                borderRadius: BorderRadius.circular(6),
                color: Colors.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
