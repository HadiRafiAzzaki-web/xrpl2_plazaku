// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';
// import 'package:xrpl2_plazaku/datas/order_data.dart';
// import 'package:xrpl2_plazaku/models/order_model.dart';
//
// class OrderStatusChartPie extends StatelessWidget {
//   const OrderStatusChartPie({super.key});
//
//   Color? getColor(ProductStatus status) {
//     switch (status) {
//       case ProductStatus.pending:
//         return Colors.orange;
//       case ProductStatus.processed:
//         return Colors.blue;
//       case ProductStatus.sent:
//         return Colors.green;
//       case ProductStatus.rejected:
//         return Colors.red;
//       case ProductStatus.finish:
//         return Colors.grey;
//       case ProductStatus.all:
//         return null;
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final Map<ProductStatus, int> statusCount = {};
//
//     for (var o in orders) {
//       statusCount[o.status] = (statusCount[o.status] ?? 0) + 1;
//     }
//
//     return PieChart(
//       PieChartData(
//         sections: statusCount.entries.map((e) {
//           final percent = (e.value / orders.length) * 100;
//           return PieChartSectionData(
//             color: getColor(e.key),
//             value: e.value.toDouble(),
//             radius: 80,
//             title: '${percent.toStringAsFixed(1)}%',
//             titleStyle: TextStyle(
//               color: Colors.white,
//               fontSize: 12,
//               fontWeight: FontWeight.bold,
//             ),
//           );
//         }).toList(),
//         centerSpaceRadius: 40,
//         sectionsSpace: 2,
//       ),
//     );
//   }
// }

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:xrpl2_plazaku/datas/order_data.dart';
import 'package:xrpl2_plazaku/models/order_model.dart';

class OrderStatusChartPie extends StatelessWidget {
  const OrderStatusChartPie({super.key});

  Color? statusColor(ProductStatus status) {
    switch (status) {
      case ProductStatus.all:
        return null;
      case ProductStatus.pending:
        return Colors.orange;
      case ProductStatus.processed:
        return Colors.blue;
      case ProductStatus.sent:
        return Colors.green;
      case ProductStatus.finish:
        return Colors.grey;
      case ProductStatus.rejected:
        return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    final Map<ProductStatus, int> orderStatus = {};

    for (var status in orders) {
      orderStatus[status.status] = (orderStatus[status.status] ?? 0) + 1;
    }
    return PieChart(
      PieChartData(
        sections: orderStatus.entries.map((e) {
          final percent = (e.value / orders.length) * 100;
          return PieChartSectionData(
            color: statusColor(e.key),
            title: '${percent.toStringAsFixed(1)}%',
            radius: 80,
            value: e.value.toDouble(),
            titleStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          );
        }).toList(),
      ),
    );
  }
}
