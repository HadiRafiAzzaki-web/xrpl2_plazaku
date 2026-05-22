import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class SellerChart extends StatelessWidget {
  final DateTimeRange? date;

  const SellerChart({super.key, this.date});

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        barGroups: List.generate(
          6,
          (index) => BarChartGroupData(
            x: index,
            barRods: [
              BarChartRodData(toY: (index + 1) * 2.0, color: Colors.blue),
            ],
          ),
        ),
      ),
    );
  }
}
