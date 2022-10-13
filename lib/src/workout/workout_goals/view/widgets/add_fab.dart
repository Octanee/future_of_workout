import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/exercise/exercise.dart';
import 'package:future_of_workout/src/logger.dart';
import 'package:future_of_workout/src/workout/workout_goals/workout_goals.dart';
import 'package:go_router/go_router.dart';

class AddFab extends StatelessWidget {
  const AddFab({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        context.pushNamed(
          ExerciseListPage.name,
          extra: ExerciseListExtra(
            multiSelected: false,
            onConfirm: (selected) async {
              final exercise = selected.first;

              await showDialog<void>(
                context: context,
                builder: (_) {
                  return NewGoalDialog(
                    onConfirm: (value) {
                      context.read<WorkoutGoalsBloc>().add(
                            WorkoutGoalsAdd(exercise: exercise, goal: value),
                          );
                    },
                  );
                },
              );
            },
          ),
        );
      },
      child: const Icon(Icons.add),
    );
  }
}
