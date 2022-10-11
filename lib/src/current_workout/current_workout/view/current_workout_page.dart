import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/current_workout/current_workout.dart';
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
        switch (state.status) {
          case CurrentWorkoutStatus.initial:
          case CurrentWorkoutStatus.finish:
            return const StartWorkout();
          case CurrentWorkoutStatus.loading:
          case CurrentWorkoutStatus.start:
          case CurrentWorkoutStatus.started:
            return const AppScaffold(body: AppLoading());
          case CurrentWorkoutStatus.failure:
            return const AppScaffold(body: AppError());
          case CurrentWorkoutStatus.loaded:
          case CurrentWorkoutStatus.updating:
          case CurrentWorkoutStatus.updated:
            final workout = state.workoutLog!;
            return AppScaffold(
              title: workout.name,
              actions: const [WorkoutTime()],
              body: ListView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                physics: const BouncingScrollPhysics(),
                children: const [
                  FinishButton(),
                  ExerciseLogsList(),
                  AddExercise(),
                ],
              ),
            );
        }
      },
    );
  }
}
