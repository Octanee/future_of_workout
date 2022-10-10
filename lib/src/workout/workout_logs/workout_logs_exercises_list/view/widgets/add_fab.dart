import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';
import 'package:future_of_workout/src/workout/workout_logs/workout_logs.dart';

class AddFab extends StatelessWidget {
  const AddFab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutLogsExercisesListBloc,
        WorkoutLogsExercisesListState>(
      buildWhen: (previous, current) =>
          previous.selected != current.selected ||
          previous.status != current.status,
      builder: (context, state) {
        final length =
            state.selected.values.where((element) => element == true).length;

        return Visibility(
          visible: length > 0,
          child: TextFloatingActionButton(
            text: 'Add $length exercises',
            isLoading: state.status == WorkoutLogsExercisesListStatus.updating,
            onPressed: () => context
                .read<WorkoutLogsExercisesListBloc>()
                .add(const WorkoutLogsExercisesListAddingToWorkout()),
          ),
        );
      },
    );
  }
}
