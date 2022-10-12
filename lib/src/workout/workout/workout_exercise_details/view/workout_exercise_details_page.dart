import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';
import 'package:future_of_workout/src/workout/workout/workout.dart';
import 'package:go_router/go_router.dart';
import 'package:workout_repository/workout_repository.dart';

class WorkoutExerciseDetailsPage extends StatelessWidget {
  const WorkoutExerciseDetailsPage({
    required this.workoutId,
    required this.workoutExerciseId,
    super.key,
  });

  static String name = 'workout-exercise-details';
  static String path = '$name/:workoutExerciseId';

  final String workoutId;
  final String workoutExerciseId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WorkoutExerciseDetailsBloc(
        workoutRepository: context.read<WorkoutRepository>(),
      )..add(
          WorkoutExerciseDetailsLoading(
            workoutId: workoutId,
            workoutExerciseId: workoutExerciseId,
          ),
        ),
      child: const WorkoutExerciseDetailsView(),
    );
  }
}

class WorkoutExerciseDetailsView extends StatelessWidget {
  const WorkoutExerciseDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context
            .read<WorkoutExerciseDetailsBloc>()
            .add(const WorkoutExerciseDetailsPop());

        return true;
      },
      child:
          BlocConsumer<WorkoutExerciseDetailsBloc, WorkoutExerciseDetailsState>(
        listenWhen: (previous, current) => previous.status != current.status,
        listener: (context, state) {
          if (state.status == WorkoutExerciseDetailsStatus.delete) {
            context.pop();
          }
        },
        buildWhen: (previous, current) =>
            previous.status != current.status ||
            previous.workoutExercise?.exercise !=
                current.workoutExercise?.exercise,
        builder: (context, state) {
          switch (state.status) {
            case WorkoutExerciseDetailsStatus.initial:
            case WorkoutExerciseDetailsStatus.loading:
              return const AppScaffold(body: AppLoading());
            case WorkoutExerciseDetailsStatus.failure:
              return const AppScaffold(body: AppError());
            case WorkoutExerciseDetailsStatus.loaded:
            case WorkoutExerciseDetailsStatus.updating:
            case WorkoutExerciseDetailsStatus.updated:
            case WorkoutExerciseDetailsStatus.delete:
              final workoutExercise = state.workoutExercise!;
              return AppScaffold(
                title: workoutExercise.exercise.name,
                body: ListView(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  physics: const BouncingScrollPhysics(),
                  children: [
                    const AddSeries(),
                    const RemoveSeries(),
                    const SeriesList(),
                    const DisplayMode(),
                    const ReplaceExercise(),
                    const DeleteExercise(),
                    AboutExerciseButton(exerciseId: workoutExercise.exercise.id)
                  ],
                ),
              );
          }
        },
      ),
    );
  }
}
