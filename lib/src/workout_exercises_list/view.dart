// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:future_of_workout/src/styles/styles.dart';
// import 'package:future_of_workout/src/widgets/widgets.dart';
// import 'package:future_of_workout/src/workout_exercises_list/cubit/workout_exercises_list_cubit.dart';
// import 'package:future_of_workout/src/workout_exercises_list/tabs/tabs.dart';

// class WorkoutExercisesListView extends StatelessWidget {
//   const WorkoutExercisesListView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return AppScaffold(
//       title: 'Exercises',
//       body: BlocBuilder<WorkoutExercisesListCubit, WorkoutExercisesListState>(
//         builder: (context, state) {
//           switch (state.status) {
//             case WorkoutExercisesListStatus.loading:
//               return const Center(
//                 child: CircularProgressIndicator(
//                   color: AppColors.yellow,
//                 ),
//               );
//             case WorkoutExercisesListStatus.loaded:
//               return _getTabView();
//             case WorkoutExercisesListStatus.failure:
//               return Center(
//                 child: Text(
//                   'Something gone wrong!',
//                   style: AppTextStyle.semiBold20,
//                 ),
//               );
//           }
//         },
//       ),
//     );
//   }

//   Widget _getTabView() {
//     return DefaultTabController(
//       length: 3,
//       child: Column(
//         children: const [
//           CustomTabBar(
//             tabs: [
//               Tab(text: 'All'),
//               Tab(text: 'Muscle'),
//               Tab(text: 'Category'),
//             ],
//           ),
//           CustomTabBarView(
//             height: 652,
//             children: [
//               WorkoutExercisesListAllTab(),
//               WorkoutExercisesListMuscleTab(),
//               WorkoutExercisesListCategoryTab(),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
