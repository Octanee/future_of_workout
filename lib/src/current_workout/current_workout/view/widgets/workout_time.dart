import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/current_workout/current_workout.dart';
import 'package:future_of_workout/src/styles/styles.dart';

class WorkoutTime extends StatelessWidget {
  const WorkoutTime({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentWorkoutBloc, CurrentWorkoutState>(
      buildWhen: (previous, current) => previous.time != current.time,
      builder: (context, state) {
        final time = Duration(seconds: state.time);

        String twoDigits(int n) => n.toString().padLeft(2, '0');

        final hours = twoDigits(time.inHours.remainder(24));
        final minutes = twoDigits(time.inMinutes.remainder(60));
        final seconds = twoDigits(time.inSeconds.remainder(60));

        return Text(
          '$hours:$minutes:$seconds',
          style: AppTextStyle.semiBold20,
        );
      },
    );
  }
}
