import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/widgets/app_scaffold.dart';
import 'package:future_of_workout/src/workout_exercise_logs_details/workout_exercise_logs_details.dart';
import 'package:workout_log_repository/workout_log_repository.dart';

class WorkoutExerciseLogsDetailsPage extends StatelessWidget {
  const WorkoutExerciseLogsDetailsPage({
    required this.workoutLogId,
    required this.workoutExerciseLogId,
    super.key,
  });

  static String name = 'workout-exercise-logs-details';
  static String path = '$name/:workoutExerciseLogId';

  final String workoutExerciseLogId;
  final String workoutLogId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WorkoutExerciseLogsDetailsBloc(
        workoutLogRepository: context.read<WorkoutLogRepository>(),
      )..add(
          WorkoutExerciseLogsDetailsSubscriptionRequest(
            workoutLogId: workoutLogId,
            workoutExerciseLogId: workoutExerciseLogId,
          ),
        ),
      child: const WorkoutExerciseLogsDetailsView(),
    );
  }
}

class WorkoutExerciseLogsDetailsView extends StatelessWidget {
  const WorkoutExerciseLogsDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppScaffold();
  }
}
