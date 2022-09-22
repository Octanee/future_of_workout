import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/current_workout_rest/current_workout_rest.dart';
import 'package:future_of_workout/src/styles/styles.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';
import 'package:go_router/go_router.dart';

class TimerActions extends StatelessWidget {
  const TimerActions({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CurrentWorkoutRestBloc, CurrentWorkoutRestState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.status == CurrentWorkoutRestStatus.complete) {
          context.pop();
        }
      },
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            _subtractButton(context),
            if (state.status == CurrentWorkoutRestStatus.runInProgress) ...[
              _pauseButton(context),
            ],
            if (state.status == CurrentWorkoutRestStatus.runPause) ...[
              _resumeButton(context),
            ],
            _stopButton(context),
            _addButton(context),
          ],
        );
      },
    );
  }

  Widget _stopButton(BuildContext context) {
    return CircleButton(
      size: 64,
      onTap: () => context
          .read<CurrentWorkoutRestBloc>()
          .add(const CurrentWorkoutRestStop()),
      child: const Icon(Icons.stop),
    );
  }

  Widget _resumeButton(BuildContext context) {
    return CircleButton(
      size: 64,
      onTap: () => context
          .read<CurrentWorkoutRestBloc>()
          .add(const CurrentWorkoutRestResumed()),
      child: const Icon(Icons.play_arrow),
    );
  }

  Widget _pauseButton(BuildContext context) {
    return CircleButton(
      size: 64,
      onTap: () => context
          .read<CurrentWorkoutRestBloc>()
          .add(const CurrentWorkoutRestPaused()),
      child: const Icon(Icons.pause),
    );
  }

  Widget _addButton(BuildContext context) {
    return CircleButton(
      onTap: () => context
          .read<CurrentWorkoutRestBloc>()
          .add(const CurrentWorkoutRestAdd()),
      child: Text(
        '+15',
        style: AppTextStyle.semiBold20,
      ),
    );
  }

  Widget _subtractButton(BuildContext context) {
    return CircleButton(
      onTap: () => context
          .read<CurrentWorkoutRestBloc>()
          .add(const CurrentWorkoutRestSubtract()),
      child: Text(
        '-15',
        style: AppTextStyle.semiBold20,
      ),
    );
  }
}
