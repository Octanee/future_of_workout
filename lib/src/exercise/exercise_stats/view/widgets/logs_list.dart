import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/exercise/exercise.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';

class LogsList extends StatelessWidget {
  const LogsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExerciseStatsBloc, ExerciseStatsState>(
      buildWhen: (previous, current) => previous.data != current.data,
      builder: (context, state) {
        final list = state.data;

        return ListView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          children: [
            Header(text: 'Logs (${list.length})'),
            ...list
                .map<Widget>(
                  (entry) => LogItem(
                    workoutExerciseLog: entry.key,
                    date: entry.value,
                  ),
                )
                .toList(),
          ],
        );
      },
    );
  }
}
