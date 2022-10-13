import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/exercise/exercise.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';

class LogsList extends StatelessWidget {
  const LogsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExerciseStatsBloc, ExerciseStatsState>(
      buildWhen: (previous, current) => previous.goal != current.goal,
      builder: (context, state) {
        final list = state.workoutExerciseLogs;
        if (list.isEmpty) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 32),
            child: AppEmptyList(
              text: 'The exercise has not yet been performed.',
            ),
          );
        }

        return ListView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          children: list
              .map<Widget>(
                (entry) =>
                    LogItem(workoutExerciseLog: entry.key, date: entry.value),
              )
              .toList(),
        );
      },
    );
  }
}
