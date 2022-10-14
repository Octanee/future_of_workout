import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:future_of_workout/src/styles/styles.dart';
import 'package:intl/intl.dart';

class DayliChart extends StatelessWidget {
  const DayliChart({
    required this.data,
    this.period = 30,
    this.aspectRatio = 1.75,
    this.horizontalCells = 6,
    this.verticalCells = 4,
    this.suffix = 'kg',
    this.isCurved = true,
    super.key,
  });

  final List<DayliData> data;
  final int period;
  final int horizontalCells;
  final int verticalCells;
  final double aspectRatio;
  final String suffix;
  final bool isCurved;

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final firstDay = now.subtract(Duration(days: period));

    final values = data.map((e) => e.value).toList();

    final minY = values.reduce(min);

    final maxY = values.reduce(max);

    final maxX = now.difference(firstDay).inDays.toDouble();

    final intervalY = (maxY - minY) / verticalCells;
    final intervalX = maxX / horizontalCells;

    return AspectRatio(
      aspectRatio: aspectRatio,
      child: LineChart(
        LineChartData(
          gridData: _getGridData(
            horizontalInterval: intervalY,
            verticalInterval: intervalX,
          ),
          borderData: FlBorderData(
            show: false,
          ),
          titlesData: _getTitlesData(
            firstDay: firstDay,
            intervalX: intervalX,
            intervalY: intervalY,
          ),
          minX: -(intervalX / horizontalCells),
          maxX: maxX + (intervalX / horizontalCells),
          minY: minY - (intervalY / verticalCells),
          maxY: maxY + (intervalY / verticalCells),
          lineBarsData: [_getBarData(firstDay: firstDay)],
        ),
      ),
    );
  }

  LineChartBarData _getBarData({required DateTime firstDay}) {
    final spots = data.map<FlSpot>((data) {
      final y = data.value;
      final x = data.date.difference(firstDay).inDays.toDouble();

      return FlSpot(x, y);
    }).toList();

    return LineChartBarData(
      isCurved: isCurved,
      color: AppColors.yellow,
      spots: spots,
    );
  }

  FlTitlesData _getTitlesData({
    required double intervalX,
    required double intervalY,
    required DateTime firstDay,
  }) =>
      FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 24,
            interval: intervalX,
            getTitlesWidget: (value, meta) => _bottomTitleWidgets(
              value: value,
              firstDay: firstDay,
              intervalX: intervalX,
            ),
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 56,
            interval: intervalY,
            getTitlesWidget: (value, meta) => _leftTitleWidgets(
              value: value,
              intervalY: intervalY,
            ),
          ),
        ),
      );

  FlGridData _getGridData({
    required double horizontalInterval,
    required double verticalInterval,
  }) {
    return FlGridData(
      show: true,
      drawVerticalLine: true,
      horizontalInterval: horizontalInterval,
      verticalInterval: verticalInterval,
      getDrawingHorizontalLine: _getGridLine,
      getDrawingVerticalLine: _getGridLine,
    );
  }

  FlLine _getGridLine(double value) => FlLine(
        color: AppColors.grey.withOpacity(0.2),
        strokeWidth: 1,
        dashArray: [2, 3],
      );

  Widget _bottomTitleWidgets({
    required double value,
    required DateTime firstDay,
    required double intervalX,
  }) {
    var title = '';
    final formatter = DateFormat('d/M');

    if (value == 0) {
      title = formatter.format(firstDay);
    } else if (value == period) {
      title = formatter.format(DateTime.now());
    } else if (value % intervalX == 0) {
      final date = firstDay.add(Duration(days: value.toInt()));
      title = formatter.format(date);
    }

    return Text(title, style: AppTextStyle.regular12);
  }

  Widget _leftTitleWidgets({
    required double value,
    required double intervalY,
  }) {
    var title = '';

    if (value % intervalY == 0) {
      title = '$value $suffix';
    }

    return Text(
      title,
      style: AppTextStyle.regular12,
      textAlign: TextAlign.left,
    );
  }
}

class DayliData {
  const DayliData({required this.value, required this.date});

  final double value;
  final DateTime date;
}