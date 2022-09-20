import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/current_workout_exercise/current_workout_exercise.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';

class AddSeriesButton extends StatelessWidget {
  const AddSeriesButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BarButton(
      text: 'Add series',
      icon: const Icon(Icons.add),
      onTap: () => context
          .read<CurrentWorkoutExerciseBloc>()
          .add(const CurrentWorkoutExerciseAddSeries()),
    );
  }
}
