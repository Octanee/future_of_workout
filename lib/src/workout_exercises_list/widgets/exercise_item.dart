// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:future_of_workout/src/data/models/models.dart';
// import 'package:future_of_workout/src/styles/app_text_style.dart';
// import 'package:future_of_workout/src/widgets/widgets.dart';
// import 'package:future_of_workout/src/workout_exercise_details/page.dart';
// import 'package:future_of_workout/src/workout_exercises_list/cubit/workout_exercises_list_cubit.dart';
// import 'package:go_router/go_router.dart';

// class ExerciseItem extends StatelessWidget {
//   const ExerciseItem({required this.exercise, super.key});

//   final Exercise exercise;

//   @override
//   Widget build(BuildContext context) {
//     return CustomCard(
//       onTap: () {
//         context.goNamed(
//           WorkoutExerciseDetailsPage.name,
//           params: {
//             'workoutId': context.read<WorkoutExercisesListCubit>().workoutId,
//             'exerciseId': exercise.id,
//           },
//           extra: true,
//         );
//       },
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         children: [
//           Flexible(
//             child: Padding(
//               padding: const EdgeInsets.only(bottom: 8),
//               child: SvgPicture.asset(
//                 exercise.imagePathStart,
//               ),
//             ),
//           ),
//           Text(
//             exercise.name,
//             style: AppTextStyle.semiBold16,
//             textAlign: TextAlign.center,
//           ),
//         ],
//       ),
//     );
//   }
// }
