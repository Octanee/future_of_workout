import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';
import 'package:future_of_workout/src/workout/workout_logs/workout_logs.dart';
import 'package:go_router/go_router.dart';
import 'package:workout_log_repository/workout_log_repository.dart';

class WorkoutLogsDetailsPage extends StatelessWidget {
  const WorkoutLogsDetailsPage({required this.workoutLogId, super.key});

  static String name = 'workout-logs-details';
  static String path = '$name/:workoutLogId';

  final String workoutLogId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WorkoutLogsDetailsBloc(
        workoutLogRepository: context.read<WorkoutLogRepository>(),
      )..add(WorkoutLogsDetailsSubscriptionRequest(id: workoutLogId)),
      child: const WorkoutLogsDetailsView(),
    );
  }
}

class WorkoutLogsDetailsView extends StatelessWidget {
  const WorkoutLogsDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WorkoutLogsDetailsBloc, WorkoutLogsDetailsState>(
      listener: (context, state) {
        if (state.status == WorkoutLogsDetailsStatus.deleted) {
          context.pop();
        }
      },
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        switch (state.status) {
          case WorkoutLogsDetailsStatus.initial:
          case WorkoutLogsDetailsStatus.loading:
            return const AppScaffold(body: AppLoading());
          case WorkoutLogsDetailsStatus.failure:
            return const AppScaffold(body: AppError());
          case WorkoutLogsDetailsStatus.deleted:
          case WorkoutLogsDetailsStatus.loaded:
            final log = state.workoutLog!;
            return AppScaffold(
              title: log.name,
              body: ListView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                physics: const BouncingScrollPhysics(),
                children: [
                  WorkoutSummaryCard(workoutLog: log),
                  const ExercisesList(),
                  const AddExercise(),
                  const DeleteWorkoutLog(),
                ],
              ),
            );
        }
      },
    );
  }
}
