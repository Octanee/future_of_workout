import 'package:future_of_workout/src/app/bloc/app_bloc.dart';
import 'package:future_of_workout/src/common.dart';
import 'package:workout_log_api/workout_log_api.dart';

class ExerciseSeriesLogItem extends StatelessWidget {
  const ExerciseSeriesLogItem({
    super.key,
    required this.series,
    this.onTap,
  });

  final ExerciseSeriesLog series;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      onTap: onTap,
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          _SeriesNumber(series: series),
          _SeriesData(series: series),
        ],
      ),
    );
  }
}

class _SeriesData extends StatelessWidget {
  const _SeriesData({required this.series});

  final ExerciseSeriesLog series;

  @override
  Widget build(BuildContext context) {
    final unit = context.read<AppBloc>().state.user!.weightUnit;

    return Expanded(
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
              style: AppTextStyle.bold28.copyWith(color: AppColors.yellow),
            ),
          ),
          BoldText(
            boldText: series.reps.toString(),
            mediumText: context.local.reps,
            boldTextStyle: AppTextStyle.bold24,
          ),
        ],
      ),
    );
  }
}

class _SeriesNumber extends StatelessWidget {
  const _SeriesNumber({required this.series});

  final ExerciseSeriesLog series;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      width: 44,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(64),
        color: series.isFinished ? AppColors.grey : AppColors.yellow,
      ),
      child: Center(
        child: Text(
          '${series.index}',
          style: AppTextStyle.bold28.copyWith(
            color: series.isFinished ? AppColors.yellow : AppColors.grey,
          ),
        ),
      ),
    );
  }
}
