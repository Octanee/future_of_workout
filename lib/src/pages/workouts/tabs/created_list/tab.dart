import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../repositories/workout_repository.dart';
import 'cubit/created_list_cubit.dart';
import 'screen.dart';

class WorkoutsCreatedListTab extends StatelessWidget {
  const WorkoutsCreatedListTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final repository = WorkoutRepository();

    return RepositoryProvider.value(
      value: repository,
      child: BlocProvider(
        create: (context) =>
            CreatedListCubit(repository: repository)..fetchList(),
        child: const WorkoutsCreatedListScreen(),
      ),
    );
  }
}
