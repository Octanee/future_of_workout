import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/styles/styles.dart';
import 'package:future_of_workout/src/widgets/custom_card.dart';
import 'package:future_of_workout/src/workout_details/workout_details.dart';

import 'package:go_router/go_router.dart';

class WorkoutsListTab extends StatelessWidget {
  const WorkoutsListTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Center(
        child: Column(
          children: List.generate(
            30,
            (index) => CustomCard(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: const Text('WorkoutsListTab'),
              ),
            ),
          ),
        ),
      ),
    );
    // BlocConsumer<CreatedListCubit, CreatedListState>(
    //   listener: (context, state) {
    //     if (state.status == CreatedListStatus.added) {
    //       final workout = state.workout;
    //       if (workout != null) {
    //         context.goNamed(
    //           WorkoutDetailsPage.name,
    //           params: {'workoutId': workout.id},
    //           extra: context.read<CreatedListCubit>(),
    //         );
    //       }
    //     }
    //   },
    //   builder: (context, state) {
    //     if (state.status == CreatedListStatus.loaded) {
    //       log('CreatedListStatus.loaded');
    //       return const WorkoutsCreatedListView();
    //     } else if (state.status == CreatedListStatus.failure) {
    //       return Center(
    //         child: Text(
    //           'Something went wrong!',
    //           style: AppTextStyle.semiBold16,
    //         ),
    //       );
    //     } else {
    //       return const Center(
    //         child: CircularProgressIndicator(
    //           color: AppColors.yellow,
    //         ),
    //       );
    //     }
    //   },
    // );
  }
}
