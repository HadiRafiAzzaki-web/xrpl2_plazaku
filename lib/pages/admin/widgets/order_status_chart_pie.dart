import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class OrderStatusChartPie extends StatelessWidget {
  const OrderStatusChartPie({super.key});

  @override
  Widget build(BuildContext context) {
    return PieChart(
      PieChartData(
        centerSpaceRadius: 40,
        sectionsSpace: 2,
        sections: [
          PieChartSectionData(
            value: 5,
            title: '5',
            color: Colors.orange,
            radius: 60,
          ),
          PieChartSectionData(
            value: 3,
            title: '3',
            color: Colors.blue,
            radius: 60,
          ),
          PieChartSectionData(
            value: 7,
            title: '7',
            color: Colors.green,
            radius: 60,
          ),
          PieChartSectionData(
            value: 2,
            title: '2',
            color: Colors.red,
            radius: 60,
          ),
        ],
      ),
    );
  }
}
