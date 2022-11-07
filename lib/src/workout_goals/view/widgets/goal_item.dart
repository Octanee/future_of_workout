import 'package:exercise_repository/exercise_repository.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:future_of_workout/src/app/bloc/app_bloc.dart';
import 'package:future_of_workout/src/common.dart';
import 'package:future_of_workout/src/exercise/exercise.dart';
import 'package:go_router/go_router.dart';
import 'package:goal_repository/goal_repository.dart';

class GoalItem extends StatelessWidget {
  const GoalItem({required this.goal, super.key});

  final Goal goal;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;

        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: CustomCard(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
            child: Column(
              children: [
                _GoalExercise(
                  exercise: goal.exercise,
                  width: width / 4,
                ),
                const SizedBox(height: 8),
                _GoalValue(value: goal.goal),
              ],
            ),
            onTap: () {
              context.pushNamed(
                ExerciseStatsPage.name,
                params: {'exerciseId': goal.exercise.id},
              );
            },
          ),
        );
      },
    );
  }
}

class _GoalExercise extends StatelessWidget {
  const _GoalExercise({required this.exercise, required this.width});

  final Exercise exercise;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              exercise.imagePath,
              width: width,
            ),
            const SizedBox(width: 8),
            SvgPicture.asset(
              exercise.imagePathSecondary,
              width: width,
            ),
            const SizedBox(height: 16),
          ],
        ),
        Text(
          exercise.name,
          style: AppTextStyle.bold20,
        ),
      ],
    );
  }
}

class _GoalValue extends StatelessWidget {
  const _GoalValue({required this.value});

  final double value;

  @override
  Widget build(BuildContext context) {
    final unit = context.read<AppBloc>().state.user!.weightUnit;

    return Row(
      textBaseline: TextBaseline.ideographic,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          '${context.locale.goal}:',
          style: AppTextStyle.medium16,
        ),
        Row(
          textBaseline: TextBaseline.ideographic,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          children: [
            Text(
              '${UnitConverter.dispalyedWeight(unit: unit, value: value)}',
              style: AppTextStyle.semiBold20,
            ),
            Text(
              unit.sufix,
              style: AppTextStyle.medium16,
            ),
          ],
        ),
      ],
    );
  }
}
