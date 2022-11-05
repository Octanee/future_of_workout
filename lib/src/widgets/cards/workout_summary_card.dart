import 'package:future_of_workout/src/app/bloc/app_bloc.dart';
import 'package:future_of_workout/src/common.dart';
import 'package:intl/intl.dart';
import 'package:workout_log_api/workout_log_api.dart';

class WorkoutSummaryCard extends StatelessWidget {
  const WorkoutSummaryCard({required this.workoutLog, super.key});

  final WorkoutLog workoutLog;

  @override
  Widget build(BuildContext context) {
    final userWeight = context.read<AppBloc>().state.user!.weight;

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: CustomCard(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildDate(context),
                _buildTime(),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildExercises(context),
                _buildKcal(userWeight: userWeight),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDate(BuildContext context) {
    final formatter =
        DateFormat('dd MMM', Localizations.localeOf(context).languageCode);

    return _CardRow(
      boldText: formatter.format(workoutLog.startDate),
      icon: const AppIcon(iconData: AppIcons.calendar),
    );
  }

  Widget _buildTime() {
    final time = workoutLog.endDate!.difference(workoutLog.startDate);

    return _CardRow(
      isReverse: true,
      boldText: '${time.inMinutes} ',
      mediumText: 'min',
      icon: const AppIcon(iconData: AppIcons.clock),
    );
  }

  Widget _buildKcal({required double userWeight}) {
    final kcal = CaloriesCalculator.inWorkout(
      workout: workoutLog,
      userWeight: userWeight,
    );

    return _CardRow(
      boldText: '$kcal ',
      mediumText: 'kcal',
      icon: const AppIcon(iconData: AppIcons.flame),
      isReverse: true,
    );
  }

  Widget _buildExercises(BuildContext context) {
    final exercises = workoutLog.workoutExerciseLogs
        .where((exercise) {
          return exercise.exerciseSeriesLogs.any((series) => series.isFinished);
        })
        .toList()
        .length;

    return _CardRow(
      boldText: '$exercises ',
      mediumText: context.local.exercisesCount(exercises),
      icon: const AppIcon(iconData: AppIcons.gym),
    );
  }
}

class _CardRow extends StatelessWidget {
  const _CardRow({
    required this.boldText,
    required this.icon,
    this.mediumText = '',
    this.isReverse = false,
  });

  final String boldText;
  final String mediumText;
  final Widget icon;
  final bool isReverse;

  @override
  Widget build(BuildContext context) {
    final children = [
      BoldText(
        boldText: boldText,
        mediumText: mediumText,
      ),
      const SizedBox(width: 8),
      icon,
    ];

    return Row(
      mainAxisAlignment:
          isReverse ? MainAxisAlignment.end : MainAxisAlignment.start,
      textBaseline: TextBaseline.alphabetic,
      children: isReverse ? children : children.reversed.toList(),
    );
  }
}
