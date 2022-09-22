import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/current_workout/current_workout.dart';
import 'package:future_of_workout/src/styles/styles.dart';

class WorkoutTime extends StatelessWidget {
  const WorkoutTime({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentWorkoutBloc, CurrentWorkoutState>(
      builder: (context, state) {
        final time = state.time;
        final hourStr = ''.padLeft(2, '0');
        final minutesStr =
            ((time / 60) % 60).floor().toString().padLeft(2, '0');
        final secondStr = (time % 60).toString().padLeft(2, '0');
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            '$hourStr:$minutesStr:$secondStr',
            style: AppTextStyle.semiBold20,
          ),
        );
      },
    );
  }
}
