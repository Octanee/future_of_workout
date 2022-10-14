import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/exercise/exercise.dart';
import 'package:future_of_workout/src/styles/styles.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';

class GoalCard extends StatelessWidget {
  const GoalCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExerciseStatsBloc, ExerciseStatsState>(
      buildWhen: (previous, current) => previous.goal != current.goal,
      builder: (context, state) {
        final goal = state.goal;

        if (goal == null) {
          return Container();
        }

        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: CustomCard(
            onTap: () async {
              final bloc = context.read<ExerciseStatsBloc>();

              await showDialog<void>(
                context: context,
                builder: (_) {
                  return GoalDialog(
                    title: 'Update goal',
                    confirmButtonText: 'Save',
                    value: goal.goal.toString(),
                    onConfirm: (value) =>
                        bloc.add(ExerciseStatsGoalChange(value: value)),
                    onDelete: () => bloc.add(const ExerciseStatsGoalDelete()),
                  );
                },
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 16, top: 8, bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Goal:',
                    style: AppTextStyle.semiBold20,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.ideographic,
                    children: [
                      Text(goal.goal.toString(), style: AppTextStyle.bold28),
                      Text('kg', style: AppTextStyle.medium20),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8),
                    child: Icon(Icons.edit),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
