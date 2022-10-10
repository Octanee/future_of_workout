import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';
import 'package:future_of_workout/src/workout/workout.dart';
import 'package:go_router/go_router.dart';

class AddWorkoutExercise extends StatelessWidget {
  const AddWorkoutExercise({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutDetailsBloc, WorkoutDetailsState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: BarButton(
            text: 'Add exercise',
            icon: const Icon(Icons.add),
            onTap: () {
              context.pushNamed(
                WorkoutExercisesListPage.name,
                params: {
                  'homePageTab': WorkoutsPage.name,
                  'workoutId': state.workout!.id,
                },
              );
            },
          ),
        );
      },
    );
  }
}
