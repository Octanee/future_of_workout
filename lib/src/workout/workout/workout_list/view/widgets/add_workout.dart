import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';
import 'package:future_of_workout/src/workout/workout/workout.dart';

class AddWorkout extends StatelessWidget {
  const AddWorkout({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const AppIcon(iconData: AppIcons.plus),
      onPressed: () async {
        final bloc = context.read<WorkoutListBloc>();

        await showDialog<String>(
          context: context,
          builder: (context) => NewWorkoutDialog(
            onConfirm: (name) =>
                bloc.add(WorkoutListNewWorkoutAdding(name: name)),
          ),
        );
      },
    );
  }
}
