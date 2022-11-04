import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/current_workout/current_workout.dart';
import 'package:future_of_workout/src/styles/styles.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class CurrentWorkoutRestPage extends StatelessWidget {
  const CurrentWorkoutRestPage({super.key});

  static String name = 'rest';
  static String path = name;
  static Map<String, String> params({required String workoutExerciseId}) => {
        'homePageTab': CurrentWorkoutPage.name,
        'currentWorkoutExerciseId': workoutExerciseId,
      };

  @override
  Widget build(BuildContext context) {
    return BlocListener<CurrentWorkoutBloc, CurrentWorkoutState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.status == CurrentWorkoutStatus.rest) {
          ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
        }
        if (state.status == CurrentWorkoutStatus.restComplete) {
          context.pop();
        }
      },
      child: AppScaffold(
        title: 'Rest',
        body: Stack(
          children: [
            Center(
              child: Column(
                children: [
                  Lottie.asset('assets/lottie/timer.json'),
                  const _TimerText(),
                ],
              ),
            ),
            const Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: _TimerActions(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _TimerActions extends StatelessWidget {
  const _TimerActions();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentWorkoutBloc, CurrentWorkoutState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            _subtractButton(context),
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
          .read<CurrentWorkoutBloc>()
          .add(const CurrentWorkoutRestStop()),
      child: const Icon(Icons.stop),
    );
  }

  Widget _addButton(BuildContext context) {
    const value = 15;

    return CircleButton(
      onTap: () => context
          .read<CurrentWorkoutBloc>()
          .add(const CurrentWorkoutRestAdd(value: value)),
      child: Text(
        '+$value',
        style: AppTextStyle.semiBold20,
      ),
    );
  }

  Widget _subtractButton(BuildContext context) {
    const value = 15;

    return CircleButton(
      onTap: () => context
          .read<CurrentWorkoutBloc>()
          .add(const CurrentWorkoutRestSubtract(value: value)),
      child: Text(
        '-$value',
        style: AppTextStyle.semiBold20,
      ),
    );
  }
}

class _TimerText extends StatelessWidget {
  const _TimerText();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentWorkoutBloc, CurrentWorkoutState>(
      buildWhen: (previous, current) =>
          previous.restDuration != current.restDuration &&
          current.restDuration != null,
      builder: (context, state) {
        final duration = state.restDuration!;

        final minutesStr =
            ((duration / 60) % 60).floor().toString().padLeft(2, '0');
        final secondStr = (duration % 60).toString().padLeft(2, '0');
        return Text(
          '$minutesStr:$secondStr',
          style: AppTextStyle.bold96,
        );
      },
    );
  }
}
