import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/current_workout_rest/current_workout_rest.dart';

class TimerActions extends StatelessWidget {
  const TimerActions({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentWorkoutRestBloc, CurrentWorkoutRestState>(
      buildWhen: (previous, current) =>
          previous.runtimeType != current.runtimeType,
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            if (state is CurrentWorkoutRestInitial) ...[
              _playButton(context, state.duration),
            ],
            if (state is CurrentWorkoutRestRunInProgress) ...[
              _pauseButton(context),
             // _replayButton(context),
            ],
            if (state is CurrentWorkoutRestRunPause) ...[
              _resumeButton(context),
              //_resetButton(context),
            ],
            if (state is CurrentWorkoutRestRunInProgress) ...[
             // _resetButton(context),
            ],
          ],
        );
      },
    );
  }

  Widget _resetButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => context
          .read<CurrentWorkoutRestBloc>()
          .add(const CurrentWorkoutRestReset()),
      child: const Icon(Icons.replay),
    );
  }

  Widget _resumeButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => context
          .read<CurrentWorkoutRestBloc>()
          .add(const CurrentWorkoutRestResumed()),
      child: const Icon(Icons.play_arrow),
    );
  }

  Widget _replayButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => context
          .read<CurrentWorkoutRestBloc>()
          .add(const CurrentWorkoutRestReset()),
      child: const Icon(Icons.replay),
    );
  }

  Widget _pauseButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => context
          .read<CurrentWorkoutRestBloc>()
          .add(const CurrentWorkoutRestPaused()),
      child: const Icon(Icons.pause),
    );
  }

  Widget _playButton(BuildContext context, int duration) {
    return FloatingActionButton(
      onPressed: () => context
          .read<CurrentWorkoutRestBloc>()
          .add(CurrentWorkoutRestStarted(duration: duration)),
      child: const Icon(Icons.play_arrow),
    );
  }
}
