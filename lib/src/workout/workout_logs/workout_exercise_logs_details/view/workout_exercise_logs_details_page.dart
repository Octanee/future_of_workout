import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/common.dart';
import 'package:future_of_workout/src/workout/workout_logs/workout_logs.dart';
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
      child: BlocListener<WorkoutExerciseLogsDetailsBloc,
          WorkoutExerciseLogsDetailsState>(
        listenWhen: (previous, current) =>
            previous.exerciseLog?.exerciseSeriesLogs !=
            current.exerciseLog?.exerciseSeriesLogs,
        listener: (context, state) {
          if (state.exerciseLog!.exerciseSeriesLogs.isEmpty) {
            context
                .read<WorkoutExerciseLogsDetailsBloc>()
                .add(const WorkoutExerciseLogsDetailsDelete());
          }
        },
        child: BlocConsumer<WorkoutExerciseLogsDetailsBloc,
            WorkoutExerciseLogsDetailsState>(
          listenWhen: (previous, current) => previous.status != current.status,
          listener: (context, state) {
            if (state.status == WorkoutExerciseLogsDetailsStatus.deleted) {
              context.pop();
            }
          },
          buildWhen: (previous, current) => previous.status != current.status,
          builder: (context, state) {
            switch (state.status) {
              case WorkoutExerciseLogsDetailsStatus.initial:
              case WorkoutExerciseLogsDetailsStatus.loading:
                return const AppScaffold(body: AppLoading());
              case WorkoutExerciseLogsDetailsStatus.failure:
                return const AppScaffold(body: AppError());
              case WorkoutExerciseLogsDetailsStatus.deleting:
              case WorkoutExerciseLogsDetailsStatus.loaded:
              case WorkoutExerciseLogsDetailsStatus.updated:
              case WorkoutExerciseLogsDetailsStatus.deleted:
                final log = state.exerciseLog!;
                return AppScaffold(
                  title: log.exercise.name,
                  body: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      children: [
                        const SeriesList(),
                        const AddSeries(),
                        const RemoveSeries(),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: AboutExerciseButton(
                            exerciseId: log.exercise.id,
                          ),
                        ),
                        const DeleteExercise(),
                      ],
                    ),
                  ),
                );
            }
          },
        ),
      ),
    );
  }
}
