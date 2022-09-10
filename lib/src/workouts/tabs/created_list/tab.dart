import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/styles/styles.dart';
import 'package:future_of_workout/src/workout_details/workout_details.dart';
import 'package:future_of_workout/src/workouts/cubit/created_list_cubit.dart';
import 'package:future_of_workout/src/workouts/tabs/created_list/view.dart';

import 'package:go_router/go_router.dart';

class WorkoutsCreatedListTab extends StatelessWidget {
  const WorkoutsCreatedListTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreatedListCubit, CreatedListState>(
      listener: (context, state) {
        if (state.status == CreatedListStatus.added) {
          final workout = state.workout;
          if (workout != null) {
            context.goNamed(
              WorkoutDetailsPage.name,
              params: {'workoutId': workout.id},
              extra: context.read<CreatedListCubit>(),
            );
          }
        }
      },
      builder: (context, state) {
        if (state.status == CreatedListStatus.loaded) {
          log('CreatedListStatus.loaded');
          return const WorkoutsCreatedListView();
        } else if (state.status == CreatedListStatus.failure) {
          return Center(
            child: Text(
              'Something went wrong!',
              style: AppTextStyle.semiBold16,
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.yellow,
            ),
          );
        }
      },
    );
  }
}
