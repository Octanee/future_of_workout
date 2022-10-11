import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/current_workout/current_workout.dart';
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
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: ExerciseSeriesLogItem(
        series: series,
        onTap: isNext || series.isFinished
            ? () async {
                final bloc = context.read<CurrentWorkoutExerciseBloc>();
                await showDialog<void>(
                  context: context,
                  builder: (builderContext) => SeriesLogDialog(
                    weight: series.weight.toString(),
                    reps: series.reps.toString(),
                    intensity: series.intensity,
                    onConfirm: (reps, weight, intensity) {
                      bloc.add(
                        CurrentWorkoutExerciseUpdateSeries(
                          series: series.copyWith(
                            weight: weight,
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
              }
            : null,
      ),
    );
  }
}
