import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../data/models/models.dart';
import '../../../../../logic/state_management/state_management.dart';
import '../../../../widgets/widgets.dart';
import '../../widgets/widgets.dart';

class WorkoutExercisesListAllTab extends StatelessWidget {
  const WorkoutExercisesListAllTab({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      hasAppBar: false,
      body: _listView(),
    );
  }

  Widget _listView() {
    return BlocBuilder<WorkoutExercisesListCubit, WorkoutExercisesListState>(
      builder: (context, state) {
        final data = state.exercises
            .map((exercise) =>
                TaggedItem<Exercise>(item: exercise, tag: exercise.name))
            .toList();
        return AlphabeticalListView<Exercise>(
          data: data,
          itemBuilder: (context, index) => ExerciseItem(
            exercise: data[index].item,
          ),
        );
      },
    );
  }
}
