import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/logic/home/home.dart';
import 'package:future_of_workout/src/presentation/pages/home/screens/workouts/tabs/created_list/view.dart';
import 'package:future_of_workout/src/presentation/pages/workout_details/page.dart';
import 'package:future_of_workout/src/presentation/styles/styles.dart';
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
