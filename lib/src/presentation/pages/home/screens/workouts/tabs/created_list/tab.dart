import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../logic/state_management/state_management.dart';
import '../../../../../../styles/styles.dart';
import '../../../../../workout_details/page.dart';
import 'view.dart';

class WorkoutsCreatedListTab extends StatelessWidget {
  const WorkoutsCreatedListTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreatedListCubit, CreatedListState>(
      listener: (context, state) {
        if (state.status == CreatedListStatus.added) {
          log('Navigate to workout details');
          final workout = state.workout;
          if (workout != null) {
            context.goNamed(WorkoutDetailsPage.name,
                params: {'id': workout.id}, extra: workout);
          }
        }
      },
      builder: (context, state) {
        switch (state.status) {
          case CreatedListStatus.loaded:
            return const WorkoutsCreatedListView();
          case CreatedListStatus.failure:
            return Center(
              child: Text(
                'Something went wrong!',
                style: AppTextStyle.semiBold16,
              ),
            );
          default:
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
