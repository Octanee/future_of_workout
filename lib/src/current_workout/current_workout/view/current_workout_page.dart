import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/current_workout/current_workout.dart';
import 'package:future_of_workout/src/home/home.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';
import 'package:future_of_workout/src/workout/workouts/workouts.dart';
import 'package:go_router/go_router.dart';

class CurrentWorkoutPage extends StatelessWidget {
  const CurrentWorkoutPage({super.key});

  static String name = 'currentWorkout';

  @override
  Widget build(BuildContext context) {
    return const CurrentWorkoutView();
  }
}

class CurrentWorkoutView extends StatelessWidget {
  const CurrentWorkoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CurrentWorkoutBloc, CurrentWorkoutState>(
      listenWhen: (previous, current) => previous != current,
      listener: (context, state) {
        if (state.workoutLog == null) {
          context
              .read<NavigationCubit>()
              .changeDestination(item: HomeNavigationItem.workouts);
        }
        if (state.status == CurrentWorkoutStatus.finish) {
          context.goNamed(
            CurrentWorkoutSummaryPage.name,
            params: {
              'homePageTab': CurrentWorkoutPage.name,
            },
          );
        }
      },
      buildWhen: (previous, current) =>
          previous.status != current.status ||
          previous.workoutLog != current.workoutLog,
      builder: (context, state) {
        if (state.workoutLog != null) {
          final workout = state.workoutLog!;
          return AppScaffold(
            title: workout.name,
            actions: const [WorkoutTime()],
            leadingIcon: null,
            body: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              physics: const BouncingScrollPhysics(),
              children: const [
                FinishButton(),
                CurrentWorkoutContent(),
              ],
            ),
          );
        }
        if (state.status == CurrentWorkoutStatus.failure) {
          return const AppScaffold(body: AppError());
        }
        return const AppScaffold(body: AppLoading());
      },
    );
  }
}
