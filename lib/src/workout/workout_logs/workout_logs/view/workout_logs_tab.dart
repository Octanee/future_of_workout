import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';
import 'package:future_of_workout/src/workout/workout.dart';
import 'package:workout_log_repository/workout_log_repository.dart';

class WorkoutsLogsTab extends StatelessWidget {
  const WorkoutsLogsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WorkoutLogsBloc(
        workoutLogRepository: context.read<WorkoutLogRepository>(),
      )..add(const WorkoutLogsLoadingRequest()),
      child: const WorkoutsLogsView(),
    );
  }
}

class WorkoutsLogsView extends StatelessWidget {
  const WorkoutsLogsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutLogsBloc, WorkoutLogsState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        switch (state.status) {
          case WorkoutLogsStatus.initial:
          case WorkoutLogsStatus.loading:
            return const AppScaffold(body: AppLoading());
          case WorkoutLogsStatus.loaded:
            return const WorkoutLogsList();
          case WorkoutLogsStatus.empty:
            return const AppScaffold(
              body: AppEmptyList(
                text: 'No workout has been done yet.',
              ),
            );
          case WorkoutLogsStatus.failure:
            return const AppScaffold(body: AppError());
        }
      },
    );
  }
}
