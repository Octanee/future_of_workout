// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:future_of_workout/src/data/models/models.dart';
// import 'package:future_of_workout/src/widgets/widgets.dart';
// import 'package:future_of_workout/src/workout_exercises_list/cubit/workout_exercises_list_cubit.dart';
// import 'package:future_of_workout/src/workout_exercises_list/widgets/widgets.dart';

// class WorkoutExercisesListAllTab extends StatelessWidget {
//   const WorkoutExercisesListAllTab({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return AppScaffold(
//       hasAppBar: false,
//       body: _listView(),
//     );
//   }

//   Widget _listView() {
//     return BlocBuilder<WorkoutExercisesListCubit, WorkoutExercisesListState>(
//       builder: (context, state) {
//         final data = state.exercises
//             .map((exercise) =>
//                 TaggedItem<Exercise>(item: exercise, tag: exercise.name),)
//             .toList();
//         return AlphabeticalListView<Exercise>(
//           data: data,
//           itemBuilder: (context, index) => ExerciseItem(
//             exercise: data[index].item,
//           ),
//         );
//       },
//     );
//   }
// }
