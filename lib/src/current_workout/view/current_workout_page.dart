import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/current_workout/current_workout.dart';
import 'package:future_of_workout/src/current_workout_exercise/current_workout_exercise.dart';
import 'package:future_of_workout/src/current_workout_summary/current_wokrout_summary.dart';
import 'package:future_of_workout/src/styles/styles.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';
import 'package:go_router/go_router.dart';

class CurrentWorkoutPage extends StatelessWidget {
  const CurrentWorkoutPage({super.key});

  static String name = 'currentWorkout';

  @override
  Widget build(BuildContext context) {
    context
        .read<CurrentWorkoutBloc>()
        .add(const CurrentWorkoutSubscriptionRequested());
    return const CurrentWorkoutView();
  }
}

class CurrentWorkoutView extends StatelessWidget {
  const CurrentWorkoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CurrentWorkoutBloc, CurrentWorkoutState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.status == CurrentWorkoutStatus.finish) {
          context.goNamed(
            CurrentWorkoutSummaryPage.name,
            params: {
              'homePageTab': CurrentWorkoutPage.name,
            },
          );
        }
        if (state.status == CurrentWorkoutStatus.started) {
          context
              .read<CurrentWorkoutBloc>()
              .add(const CurrentWorkoutSubscriptionRequested());
        }
      },
      buildWhen: (previous, current) =>
          previous.status != current.status ||
          previous.workoutLog != current.workoutLog,
      builder: (context, state) {
        if (state.status == CurrentWorkoutStatus.initial) {
          return _buildInitial();
        } else if (state.status == CurrentWorkoutStatus.loading) {
          return _buildLoading();
        } else if (state.status == CurrentWorkoutStatus.failure) {
          return _buildFailure();
        }
        if (state.workoutLog != null) {
          return _buildContent(context, state);
        }
        return const AppScaffold();
      },
    );
  }

  Widget _buildInitial() {
    return const AppScaffold(
      title: 'Workout',
      body: Center(child: StartWorkoutButton()),
    );
  }

  Widget _buildLoading() {
    return const AppScaffold(
      body: AppLoading(),
    );
  }

  Widget _buildFailure() {
    return AppScaffold(
      body: Center(
        child: Text(
          'Something gone wrong...',
          style: AppTextStyle.semiBold20,
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, CurrentWorkoutState state) {
    final workoutLog = state.workoutLog!;

    return AppScaffold(
      title: workoutLog.name,
      actions: const [WorkoutTime()],
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: ListView(
          children: [
            const FinishButton(),
            ...workoutLog.workoutExerciseLogs
                .map<Widget>(
                  (workoutExerciseLog) => WorkoutExerciseLogItem(
                    workoutExerciseLog: workoutExerciseLog,
                    onTap: () {
                      context.goNamed(
                        CurrentWorkoutExercisePage.name,
                        params: {
                          'homePageTab': CurrentWorkoutPage.name,
                          'currentWorkoutExerciseId': workoutExerciseLog.id
                        },
                      );
                    },
                  ),
                )
                .toList(),
          ],
        ),
      ),
    );
  }
}
