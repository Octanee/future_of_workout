import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../logic/workout_exercise_details/workout_exercise_details.dart';
import '../../styles/styles.dart';
import '../../widgets/widgets.dart';
import '../workout_details/workout_details.dart';
import 'widgets/widgets.dart';

class WorkoutExerciseDetailsView extends StatelessWidget {
  const WorkoutExerciseDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WorkoutExerciseDetailsCubit,
        WorkoutExerciseDetailsState>(
      listener: (context, state) {
        if (state.status == WorkoutExerciseDetailsStatus.saved) {
          final workoutId =
              context.read<WorkoutExerciseDetailsCubit>().workoutId;

          context.goNamed(
            WorkoutDetailsPage.name,
            params: {
              'workoutId': workoutId,
            },
          );
        }
      },
      builder: (context, state) {
        switch (state.status) {
          case WorkoutExerciseDetailsStatus.loading:
            return const AppLoading(text: 'Loading...');
          case WorkoutExerciseDetailsStatus.failure:
            return const AppError();
          default:
            return _buildContent();
        }
      },
    );
  }

  Widget _buildContent() =>
      BlocBuilder<WorkoutExerciseDetailsCubit, WorkoutExerciseDetailsState>(
        buildWhen: (previous, current) =>
            current.status == WorkoutExerciseDetailsStatus.loaded,
        builder: (context, state) {
          final workoutExercise = state.workoutExercise!;
          return AppScaffold(
            title: workoutExercise.exercise.name,
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.info_outline_rounded,
                    color: AppColors.grey),
              ),
              IconButton(
                onPressed: () {
                  context
                      .read<WorkoutExerciseDetailsCubit>()
                      .saveWorkoutExercise();
                },
                icon: const Icon(Icons.save_outlined, color: AppColors.grey),
              ),
            ],
            body: BlocBuilder<WorkoutExerciseDetailsCubit,
                WorkoutExerciseDetailsState>(
              buildWhen: (previous, current) =>
                  previous.status == WorkoutExerciseDetailsStatus.adding &&
                  current.status == WorkoutExerciseDetailsStatus.added,
              builder: (context, state) {
                return ListView(
                  padding: const EdgeInsets.all(16.0),
                  children: [
                    BarButton(
                      text: 'Add Set',
                      icon: Icons.add,
                      onTap: () {
                        context.read<WorkoutExerciseDetailsCubit>().addSeries();
                      },
                    ),
                    ...state.workoutExercise!.seriesOfExercise.map<Widget>(
                        (series) => ExerciseSeriesItem(series: series))
                  ],
                );
              },
            ),
          );
        },
      );
}
