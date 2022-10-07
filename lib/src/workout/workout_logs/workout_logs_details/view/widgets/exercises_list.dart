import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';
import 'package:future_of_workout/src/workout/workout.dart';

class ExercisesList extends StatelessWidget {
  const ExercisesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutLogsDetailsBloc, WorkoutLogsDetailsState>(
      buildWhen: (previous, current) =>
          previous.workoutLog?.workoutExerciseLogs !=
          current.workoutLog?.workoutExerciseLogs,
      builder: (context, state) {
        final logs = state.workoutLog!.workoutExerciseLogs;
        return Visibility(
          visible: logs.isNotEmpty,
          child: Column(
            children: [
              const Header(text: 'Exercises'),
              ...logs.map<Widget>(
                (exerciseLog) => ExerciseLogItem(
                  log: exerciseLog,
                  workoutId: state.workoutLog!.id,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
