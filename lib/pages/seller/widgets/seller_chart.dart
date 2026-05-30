import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class SellerChart extends StatelessWidget {
  const SellerChart({super.key});

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        borderData: FlBorderData(show: false),
        gridData: FlGridData(show: true, drawVerticalLine: false),
        titlesData: FlTitlesData(
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: true)),
        ),
        barGroups: List.generate(
          6,
          (index) => BarChartGroupData(
            x: index,
            barRods: [
              BarChartRodData(
                toY: index.toDouble(),
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
