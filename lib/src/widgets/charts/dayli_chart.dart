import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:future_of_workout/src/logger.dart';
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
    this.goal,
    super.key,
  });

  final List<DayliData> data;
  final int period;
  final int horizontalCells;
  final int verticalCells;
  final double aspectRatio;
  final String suffix;
  final bool isCurved;
  final double? goal;

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final firstDay = now.subtract(Duration(days: period));

    final values = data.map((e) => e.value).toList();

    var minY = values.reduce(min).floor();

    var maxY = values.reduce(max).ceil();

    if (minY == maxY) {
      minY -= 1;
      maxY += 1;
    }

    final maxX = now.difference(firstDay).inDays.toDouble();

    var intervalY = (maxY - minY) / verticalCells;
    if (intervalY == 0) intervalY = 5;

    var intervalX = maxX / horizontalCells;
    if (intervalX == 0) intervalX = 5;

    return AspectRatio(
      aspectRatio: aspectRatio,
      child: LineChart(
        LineChartData(
          extraLinesData: _getExtraLine(),
          gridData: _getGridData(
            horizontalInterval: intervalY,
            verticalInterval: intervalX,
          ),
          borderData: FlBorderData(
            show: false,
          ),
          titlesData: _getTitlesData(
            firstDay: firstDay,
            intervalX: intervalX.roundToDouble(),
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
      final x = data.date.difference(firstDay).inDays.toDouble() + 1;

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
      title = '${value.toStringAsFixed(1)} $suffix';
    }

    return Text(
      title,
      style: AppTextStyle.regular12,
      textAlign: TextAlign.left,
    );
  }

  ExtraLinesData? _getExtraLine() {
    if (goal == null) {
      return null;
    }

    return ExtraLinesData(
      horizontalLines: [
        HorizontalLine(
          y: goal!,
          label: HorizontalLineLabel(
            show: true,
            labelResolver: (value) => '${value.y} $suffix',
            style: AppTextStyle.medium12,
          ),
          dashArray: [5, 1],
          color: AppColors.grey.withOpacity(0.75),
        )
      ],
    );
  }
}

class DayliData {
  const DayliData({required this.value, required this.date});

  final double value;
  final DateTime date;
}
