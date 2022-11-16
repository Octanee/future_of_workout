import 'package:future_of_workout/src/common.dart';
import 'package:future_of_workout/src/workout/workout/workout.dart';
import 'package:go_router/go_router.dart';
import 'package:workout_repository/workout_repository.dart';

class WorkoutDetailsPage extends StatelessWidget {
  const WorkoutDetailsPage({
    required this.workoutId,
    super.key,
  });

  static String name = 'workout-details';
  static String path = '$name/:workoutId';

  final String workoutId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WorkoutDetailsBloc>(
      create: (context) {
        final repository = context.read<WorkoutRepository>();

        return WorkoutDetailsBloc(
          workoutRepository: repository,
        )..add(WorkoutDetailsWorkoutSubscriptionRequested(id: workoutId));
      },
      child: const WorkoutDetailsView(),
    );
  }
}

class WorkoutDetailsView extends StatelessWidget {
  const WorkoutDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WorkoutDetailsBloc, WorkoutDetailsState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.status == WorkoutDetailsStatus.delete) {
          context.pop();
        }
      },
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        switch (state.status) {
          case WorkoutDetailsStatus.init:
          case WorkoutDetailsStatus.loading:
            return const AppScaffold(body: AppLoading());
          case WorkoutDetailsStatus.failure:
            return const AppScaffold(body: AppError());
          case WorkoutDetailsStatus.loaded:
          case WorkoutDetailsStatus.empty:
          case WorkoutDetailsStatus.updating:
          case WorkoutDetailsStatus.updated:
          case WorkoutDetailsStatus.delete:
            final workout = state.workout!;
            return AppScaffold(
              title: workout.name,
             // actions: const [FavoriteButton()],
              body: ListView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                physics: const BouncingScrollPhysics(),
                children: const [
                  StartWorkoutButton(),
                  AddWorkoutExercise(),
                  WorkoutExercisesList(),
                  RenameWorkout(),
                  DeleteWorkout(),
                ],
              ),
            );
        }
      },
    );
  }
}
