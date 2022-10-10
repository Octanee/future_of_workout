import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';
import 'package:future_of_workout/src/workout/workout.dart';

class RenameWorkout extends StatelessWidget {
  const RenameWorkout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutDetailsBloc, WorkoutDetailsState>(
      buildWhen: (previous, current) =>
          previous.workout?.name != current.workout?.name,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: BarButton(
            text: 'Rename',
            icon: const Icon(Icons.edit_outlined),
            onTap: () async {
              final bloc = context.read<WorkoutDetailsBloc>();

              await showDialog<void>(
                context: context,
                builder: (builderContext) => RenameWorkoutDialog(
                  name: state.workout!.name,
                  onConfirm: (value) =>
                      bloc.add(WorkoutDetailsRenameWorkout(name: value)),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
