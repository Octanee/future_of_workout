import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/current_workout/current_workout.dart';
import 'package:future_of_workout/src/shared/shared.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';

class CurrentWorkoutRestPage extends StatelessWidget {
  const CurrentWorkoutRestPage({required this.duration, super.key});

  static String name = 'rest';
  static String path = '$name/:time';

  final int duration;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CurrentWorkoutRestBloc(ticker: const Ticker(), duration: duration)
            ..add(CurrentWorkoutRestStarted(duration: duration)),
      child: const CurrentWorkoutRestView(),
    );
  }
}

class CurrentWorkoutRestView extends StatelessWidget {
  const CurrentWorkoutRestView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Rest',
      body: Stack(
        children: const [
          Center(child: TimerText()),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: TimerActions(),
            ),
          )
        ],
      ),
    );
  }
}
