import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/current_workout_rest/current_workout_rest.dart';

class TimerText extends StatelessWidget {
  const TimerText({super.key});

  @override
  Widget build(BuildContext context) {
    final duration =
        context.select((CurrentWorkoutRestBloc bloc) => bloc.state.duration);

    final minutesStr =
        ((duration / 60) % 60).floor().toString().padLeft(2, '0');
    final secondStr = (duration % 60).toString().padLeft(2, '0');
    return Text(
      '$minutesStr:$secondStr',
      style: Theme.of(context).textTheme.headline1,
    );
  }
}
