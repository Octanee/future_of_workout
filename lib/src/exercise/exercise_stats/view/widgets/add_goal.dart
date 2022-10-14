import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/exercise/exercise.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';

class AddGoal extends StatelessWidget {
  const AddGoal({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExerciseStatsBloc, ExerciseStatsState>(
      buildWhen: (previous, current) => previous.goal != current.goal,
      builder: (context, state) {
        return Visibility(
          visible: state.goal == null,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: AddButton(
              text: 'Add goal',
              onTap: () async {
                final bloc = context.read<ExerciseStatsBloc>();

                await showDialog<void>(
                  context: context,
                  builder: (_) {
                    return GoalDialog(
                      title: 'Add goal',
                      onConfirm: (value) =>
                          bloc.add(ExerciseStatsAddGoal(value: value)),
                    );
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }
}
