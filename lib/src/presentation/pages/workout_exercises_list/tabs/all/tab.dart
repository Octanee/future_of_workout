import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/data/models/models.dart';
import 'package:future_of_workout/src/logic/workout_exercises_list/workout_exercises_list.dart';
import 'package:future_of_workout/src/presentation/pages/workout_exercises_list/widgets/widgets.dart';
import 'package:future_of_workout/src/presentation/widgets/widgets.dart';

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
                TaggedItem<Exercise>(item: exercise, tag: exercise.name),)
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
