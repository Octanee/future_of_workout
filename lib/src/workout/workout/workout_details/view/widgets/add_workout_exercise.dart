import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/exercise/exercise.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';
import 'package:future_of_workout/src/workout/workout/workout.dart';
import 'package:go_router/go_router.dart';

class AddWorkoutExercise extends StatelessWidget {
  const AddWorkoutExercise({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutDetailsBloc, WorkoutDetailsState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: AddButton(
            text: 'Add exercise',
            onTap: () {
              context.pushNamed(
                ExerciseListPage.name,
                extra: ExerciseListExtra(
                  selectionType: SelectionType.multiple,
                  onConfirm: (selected) async {
                    context
                        .read<WorkoutDetailsBloc>()
                        .add(WorkoutDetailsAddExercises(exercises: selected));
                  },
                ),
              );
            },
          ),
        );
      },
    );
  }
}
