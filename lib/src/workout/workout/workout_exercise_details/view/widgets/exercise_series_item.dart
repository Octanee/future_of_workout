import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/app/bloc/app_bloc.dart';
import 'package:future_of_workout/src/shared/unit_converter.dart';
import 'package:future_of_workout/src/styles/styles.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';
import 'package:future_of_workout/src/workout/workout/workout.dart';
import 'package:workout_api/workout_api.dart';

class ExerciseSeriesItem extends StatelessWidget {
  const ExerciseSeriesItem({
    super.key,
    required this.series,
    required this.value,
    this.isMulti = false,
  });

  final ExerciseSeries series;
  final int value;
  final bool isMulti;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: CustomCard(
        onTap: () => onTap(context),
        child: Column(
          children: [
            _SeriesData(value: value, series: series),
            _RestData(series: series),
          ],
        ),
      ),
    );
  }

  Future<void> onTap(BuildContext context) async {
    final bloc = context.read<WorkoutExerciseDetailsBloc>();
    final unit = context.read<AppBloc>().state.user!.weightUnit;

    await showDialog<String>(
      context: context,
      builder: (context) {
        return SeriesEditDialog(
          title: isMulti ? 'Change all series' : 'Change $value series',
          reps: series.reps.toString(),
          weight: UnitConverter.dispalyedWeight(
            unit: unit,
            value: series.weight,
          ).toString(),
          weightSuffix: unit.sufix,
          rest: series.rest.toString(),
          onConfirm: (int reps, double weight, int rest) {
            final value = UnitConverter.dataWeight(unit: unit, value: weight);

            final newSeries = series.copyWith(
              reps: reps,
              weight: value,
              rest: rest,
            );
            
            final event = isMulti
                ? WorkoutExerciseDetailsAllSeriesChanged(series: newSeries)
                : WorkoutExerciseDetailsExerciseSeriesChanged(
                    index: series.index,
                    series: newSeries,
                  );

            bloc.add(event);
          },
        );
      },
    );
  }
}

class _SeriesData extends StatelessWidget {
  const _SeriesData({
    required this.value,
    required this.series,
  });

  final int value;
  final ExerciseSeries series;

  @override
  Widget build(BuildContext context) {
    final unit = context.read<AppBloc>().state.user!.weightUnit;

    return CustomCard(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          _SeriesNumber(value: value),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BoldText(
                  boldText: UnitConverter.dispalyedWeight(
                    unit: unit,
                    value: series.weight,
                  ).toString(),
                  mediumText: unit.sufix,
                  boldTextStyle: AppTextStyle.bold24,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    '/',
                    style:
                        AppTextStyle.bold28.copyWith(color: AppColors.yellow),
                  ),
                ),
                BoldText(
                  boldText: series.reps.toString(),
                  mediumText: 'reps',
                  boldTextStyle: AppTextStyle.bold24,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SeriesNumber extends StatelessWidget {
  const _SeriesNumber({required this.value});

  final int value;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      width: 44,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(64),
        color: AppColors.yellow,
      ),
      child: Center(
        child: Text(
          '$value',
          style: AppTextStyle.bold28,
        ),
      ),
    );
  }
}

class _RestData extends StatelessWidget {
  const _RestData({required this.series});

  final ExerciseSeries series;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Icon(Icons.timer_outlined),
          ),
          Text(
            'REST',
            style: AppTextStyle.semiBold20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              ':',
              style: AppTextStyle.bold20.copyWith(color: AppColors.yellow),
            ),
          ),
          BoldText(
            boldText: series.rest.toString(),
            mediumText: 's',
            boldTextStyle: AppTextStyle.bold24,
          ),
        ],
      ),
    );
  }
}