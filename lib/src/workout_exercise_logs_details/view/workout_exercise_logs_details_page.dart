import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/exercise_details/exercise_details.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';
import 'package:future_of_workout/src/workout_exercise_logs_details/workout_exercise_logs_details.dart';
import 'package:go_router/go_router.dart';
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
    return WillPopScope(
      onWillPop: () async {
        context
            .read<WorkoutExerciseLogsDetailsBloc>()
            .add(const WorkoutExerciseLogsDetailsPop());
        return true;
      },
      child: BlocBuilder<WorkoutExerciseLogsDetailsBloc,
          WorkoutExerciseLogsDetailsState>(
        builder: (context, state) {
          switch (state.status) {
            case WorkoutExerciseLogsDetailsStatus.initial:
            case WorkoutExerciseLogsDetailsStatus.loading:
              return const AppScaffold(body: AppLoading());
            case WorkoutExerciseLogsDetailsStatus.failure:
              return const AppScaffold(body: AppError());
            case WorkoutExerciseLogsDetailsStatus.loaded:
            case WorkoutExerciseLogsDetailsStatus.updated:
              final log = state.exerciseLog!;
              return AppScaffold(
                title: log.exercise.name,
                body: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      ...log.exerciseSeriesLogs.map<Widget>(
                        (series) => Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: ExerciseSeriesLogItem(
                            series: series,
                            onTap: () async {
                              final bloc = context
                                  .read<WorkoutExerciseLogsDetailsBloc>();
                              await showDialog<void>(
                                context: context,
                                builder: (builderContext) => SeriesLogDialog(
                                  weight: series.weight.toString(),
                                  reps: series.reps.toString(),
                                  onConfirm: (reps, weight) {
                                    bloc.add(
                                      WorkoutExerciseLogsDetailsUpdateSeries(
                                        seriesLog: series.copyWith(
                                          weight: weight,
                                          reps: reps,
                                          isFinished: true,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      AboutExerciseButton(exerciseId: log.exercise.id),
                    ],
                  ),
                ),
              );
          }
        },
      ),
    );
  }
}
