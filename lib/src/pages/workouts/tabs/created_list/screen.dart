import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../various/text_style.dart';
import 'cubit/created_list_cubit.dart';
import 'widgets/workout_list_view.dart';

class WorkoutsCreatedListScreen extends StatelessWidget {
  const WorkoutsCreatedListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<CreatedListCubit>().state;

    switch (state.status) {
      case CreatedListStatus.loading:
        return const Center(child: CircularProgressIndicator());
      case CreatedListStatus.success:
        return WorkoutsCreatedListView(workouts: state.workouts);
      case CreatedListStatus.failure:
        return Center(
          child: Text(
            'Something went wrong!',
            style: AppTextStyle.semiBold16,
          ),
        );
    }
  }
}
