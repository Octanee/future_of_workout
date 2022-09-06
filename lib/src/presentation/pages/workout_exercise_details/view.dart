import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/state_management/state_management.dart';
import '../../styles/styles.dart';
import '../../widgets/widgets.dart';

class WorkoutExerciseDetailsView extends StatelessWidget {
  const WorkoutExerciseDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WorkoutExerciseDetailsCubit,
        WorkoutExerciseDetailsState>(
      listener: (context, state) {
        // TODO: implement listener
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
                onPressed: () {},
                icon: const Icon(Icons.save_outlined, color: AppColors.grey),
              ),
            ],
          );
        },
      );
}
