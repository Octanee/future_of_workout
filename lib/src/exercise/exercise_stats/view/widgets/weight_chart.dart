import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/exercise/exercise.dart';
import 'package:future_of_workout/src/styles/app_colors.dart';
import 'package:future_of_workout/src/styles/app_text_style.dart';
import 'package:future_of_workout/src/widgets/cards/cards.dart';
import 'package:intl/intl.dart';
import 'package:workout_log_repository/workout_log_repository.dart';

const period = 30;

class WeightChart extends StatelessWidget {
  const WeightChart({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExerciseStatsBloc, ExerciseStatsState>(
      buildWhen: (previous, current) =>
          previous.workoutExerciseLogs != current.workoutExerciseLogs,
      builder: (context, state) {
        final now = DateTime.now();
        final firstDay = now.subtract(const Duration(days: period));

        final weights = _getWeights(list: state.workoutExerciseLogs);

        final minY = weights.reduce(min);
        final maxY = weights.reduce(max);
        final maxX = now.difference(firstDay).inDays.toDouble();

        final intervalY = (maxY - minY) / 4;
        final intervalX = maxX / 6;

        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: AspectRatio(
            aspectRatio: 1.7,
            child: CustomCard(
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 16,
                  left: 8,
                  top: 24,
                  bottom: 8,
                ),
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
                    minX: -(intervalX / 10),
                    maxX: maxX + (intervalX / 10),
                    minY: minY - (intervalY / 2),
                    maxY: maxY + (intervalY / 2),
                    lineBarsData: [
                      _getBarData(
                        firstDay: firstDay,
                        list: state.workoutExerciseLogs,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  List<double> _getWeights({
    required List<MapEntry<WorkoutExerciseLog, DateTime>> list,
  }) {
    final weights = <double>[];

    for (final entry in list) {
      final exerciseLog = entry.key;
      final value = exerciseLog.exerciseSeriesLogs
          .where((series) => series.isFinished)
          .map((e) => e.weight);

      weights.addAll(value);
    }
    return weights;
  }

  LineChartBarData _getBarData({
    required DateTime firstDay,
    required List<MapEntry<WorkoutExerciseLog, DateTime>> list,
  }) {
    final spots = list.map<FlSpot>((entry) {
      final y = entry.key.exerciseSeriesLogs.map((e) => e.weight).reduce(max);

      final x = entry.value.difference(firstDay).inDays;

      return FlSpot(x.toDouble(), y);
    }).toList();

    return LineChartBarData(
      isCurved: true,
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
            reservedSize: 48,
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

    return Text(title, style: AppTextStyle.semiBold12);
  }

  Widget _leftTitleWidgets({
    required double value,
    required double intervalY,
  }) {
    var title = '';

    if (value % intervalY == 0) {
      title = value.toString();
    }

    return Text(
      title,
      style: AppTextStyle.semiBold12,
      textAlign: TextAlign.left,
    );
  }
}
