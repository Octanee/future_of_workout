import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/styles/styles.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';
import 'package:future_of_workout/src/workout/workout/workout.dart';
import 'package:workout_api/workout_api.dart';

class AdvancedExerciseSeriesItem extends StatelessWidget {
  const AdvancedExerciseSeriesItem({
    super.key,
    required this.series,
  });

  final ExerciseSeries series;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: CustomCard(
        onTap: () async {
          final bloc = context.read<WorkoutExerciseDetailsBloc>();

          await showDialog<String>(
            context: context,
            builder: (context) {
              return SeriesEditDialog(
                title: 'Change ${series.index} series',
                reps: series.reps.toString(),
                weight: series.weight.toString(),
                rest: series.rest.toString(),
                onConfirm: (int reps, double weight, int rest) {
                  final newSeries = series.copyWith(
                    reps: reps,
                    weight: weight,
                    rest: rest,
                  );
                  bloc.add(
                    WorkoutExerciseDetailsExerciseSeriesChanged(
                      index: series.index,
                      series: newSeries,
                    ),
                  );
                },
              );
            },
          );
        },
        child: Column(
          children: [
            _getTop(),
            _getBottom(),
          ],
        ),
      ),
    );
  }

  Widget _getBottom() {
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
          Row(
            textBaseline: TextBaseline.alphabetic,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            children: [
              Text(
                series.rest.toString(),
                style: AppTextStyle.bold28,
              ),
              Text(
                's',
                style: AppTextStyle.medium16,
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _getTop() {
    return CustomCard(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Container(
            height: 44,
            width: 44,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(64),
              color: AppColors.yellow,
            ),
            child: Center(
              child: Text(
                '${series.index}',
                style: AppTextStyle.bold28,
              ),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  textBaseline: TextBaseline.alphabetic,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  children: [
                    Text(
                      series.weight.toString(),
                      style: AppTextStyle.bold28,
                    ),
                    Text(
                      'kg',
                      style: AppTextStyle.medium16,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    '/',
                    style:
                        AppTextStyle.bold28.copyWith(color: AppColors.yellow),
                  ),
                ),
                Row(
                  textBaseline: TextBaseline.alphabetic,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  children: [
                    Text(
                      series.reps.toString(),
                      style: AppTextStyle.bold28,
                    ),
                    Text(
                      'reps',
                      style: AppTextStyle.medium16,
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
