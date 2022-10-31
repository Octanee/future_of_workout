import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';
import 'package:future_of_workout/src/workout_goals/workout_goals.dart';
import 'package:goal_repository/goal_repository.dart';

class WorkoutGoalsTab extends StatelessWidget {
  const WorkoutGoalsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WorkoutGoalsBloc(
        goalRepository: context.read<GoalRepository>(),
      )..add(const WorkoutGoalsSubscriptionRequested()),
      child: const WorkoutGoalsView(),
    );
  }
}

class WorkoutGoalsView extends StatelessWidget {
  const WorkoutGoalsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutGoalsBloc, WorkoutGoalsState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        switch (state.status) {
          case WorkoutGoalsStatus.initial:
          case WorkoutGoalsStatus.loading:
            return const AppScaffold(body: AppLoading());
          case WorkoutGoalsStatus.failure:
            return const AppScaffold(body: AppError());
          case WorkoutGoalsStatus.empty:
            return const HomeWrapper(
              floatingActionButton: SearchFab(),
              body: AppEmptyList(
                text: 'No one goals has been set yet.',
              ),
            );
          case WorkoutGoalsStatus.loaded:
          case WorkoutGoalsStatus.add:
            return const HomeWrapper(
              floatingActionButton: SearchFab(),
              body: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: GoalsList(),
              ),
            );
        }
      },
    );
  }
}
