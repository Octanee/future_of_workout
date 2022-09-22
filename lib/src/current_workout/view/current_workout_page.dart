import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/current_workout/current_workout.dart';
import 'package:future_of_workout/src/logger.dart';
import 'package:future_of_workout/src/styles/styles.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';

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
          // TODO(Octane): Navigate to WorkoutSummaryPage
          logger.i('Navigate to WorkoutSummaryPage');
        }
      },
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        if (state.status == CurrentWorkoutStatus.initial) {
          return _buildInitial();
        } else if (state.status == CurrentWorkoutStatus.loading) {
          return _buildLoading();
        } else if (state.status == CurrentWorkoutStatus.failure) {
          return _buildFailure();
        }
        return _buildContent(context, state);
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
      body: ListView(
        children: [
          const FinishButton(),
          ...workoutLog.workoutExerciseLogs
              .map<Widget>(
                (workoutExerciseLog) => WorkoutExerciseLogItem(
                  workoutExerciseLog: workoutExerciseLog,
                ),
              )
              .toList(),
        ],
      ),
    );
  }
}
