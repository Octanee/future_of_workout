import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../data/models/exercise_series.dart';
import '../../../logic/state_management/state_management.dart';
import '../../styles/styles.dart';
import '../../widgets/widgets.dart';
import '../workout_details/workout_details.dart';

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
            return Center(
              child: Text(
                'Something gone wront :(',
                style: AppTextStyle.semiBold20,
              ),
            );
          default:
            return _buildContent();
        }
      },
    );
  }

  Widget _buildContent() =>
      BlocBuilder<WorkoutExerciseDetailsCubit, WorkoutExerciseDetailsState>(
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
            body: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                const BarButton(text: 'Add Set', icon: Icons.add),
                ...state.workoutExercise!.seriesOfExercise
                    .map<Widget>(_buildItem)
              ],
            ),
          );
        },
      );

  Widget _buildItem(ExerciseSeries series) => Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: CustomCard(
          padding: const EdgeInsets.all(8),
          child: Text(
            series.index.toString(),
          ),
        ),
      );
}
