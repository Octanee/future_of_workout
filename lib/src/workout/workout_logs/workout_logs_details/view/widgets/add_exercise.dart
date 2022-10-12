import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/exercise/exercise.dart';
import 'package:future_of_workout/src/widgets/buttons/add_button.dart';
import 'package:future_of_workout/src/workout/workout_logs/workout_logs.dart';
import 'package:go_router/go_router.dart';

class AddExercise extends StatelessWidget {
  const AddExercise({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: AddButton(
        text: 'Add exercise',
        onTap: () {
          context.pushNamed(
            ExerciseListPage.name,
            extra: ExerciseListExtra(
              onConfirm: (selected) {
                context
                    .read<WorkoutLogsDetailsBloc>()
                    .add(WorkoutLogsDetailsAddExercises(exercises: selected));
              },
            ),
          );
        },
      ),
    );
  }
}
