import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/app/bloc/app_bloc.dart';
import 'package:future_of_workout/src/current_workout/current_workout.dart';
import 'package:future_of_workout/src/shared/unit_converter.dart';
import 'package:future_of_workout/src/styles/app_colors.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:workout_log_api/workout_log_api.dart';

class SeriesItem extends StatelessWidget {
  const SeriesItem({
    super.key,
    required this.series,
    required this.isNext,
  });

  final ExerciseSeriesLog series;
  final bool isNext;

  @override
  Widget build(BuildContext context) {
    final isClickable = isNext || series.isFinished;
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: AbsorbPointer(
        absorbing: !isClickable,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: isClickable ? null : AppColors.grey.withOpacity(0.25),
            borderRadius: BorderRadius.circular(16),
          ),
          child: ExerciseSeriesLogItem(
            series: series,
            onTap: () async {
              final bloc = context.read<CurrentWorkoutExerciseBloc>();
              final unit = context.read<AppBloc>().state.user!.weightUnit;

              await showDialog<void>(
                context: context,
                builder: (builderContext) => SeriesLogDialog(
                  weight: UnitConverter.dispalyedWeight(
                    unit: unit,
                    value: series.weight,
                  ).toString(),
                  weightSuffix: unit.sufix,
                  reps: series.reps.toString(),
                  intensity: series.intensity,
                  onConfirm: (reps, weight, intensity) {
                    final value = UnitConverter.dataWeight(
                      unit: unit,
                      value: weight,
                    );

                    bloc.add(
                      CurrentWorkoutExerciseUpdateSeries(
                        series: series.copyWith(
                          weight: value,
                          reps: reps,
                          intensity: intensity,
                          isFinished: true,
                        ),
                      ),
                    );
                    if (!series.isFinished) {
                      context.goNamed(
                        CurrentWorkoutRestPage.name,
                        params: {
                          'homePageTab': CurrentWorkoutPage.name,
                          'currentWorkoutExerciseId': series.id,
                          'time': series.rest.toString(),
                        },
                      );
                    }
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
