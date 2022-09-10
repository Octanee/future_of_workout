// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:future_of_workout/src/data/models/models.dart';
// import 'package:future_of_workout/src/styles/styles.dart';
// import 'package:future_of_workout/src/widgets/widgets.dart';
// import 'package:future_of_workout/src/workout_details/workout_details.dart';

// import 'package:go_router/go_router.dart';

// class WorkoutItem extends StatelessWidget {
//   const WorkoutItem({required this.workout, super.key});

//   final Workout workout;

//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (context, constraints) => CustomCard(
//         onTap: () => context.goNamed(
//           WorkoutDetailsPage.name,
//           params: {'workoutId': workout.id},
//         ),
//         child: ClipRRect(
//           borderRadius: BorderRadius.circular(16),
//           child: Stack(
//             children: [
//               _getFavorit(constraints, context),
//               _getBody(constraints),
//               _getName(constraints),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _getFavorit(BoxConstraints constraints, BuildContext context) {
//     return Align(
//       alignment: Alignment.topRight,
//       child: IconButton(
//         onPressed: () {
//          // context.read<CreatedListCubit>().toggleFavorite(workout: workout);
//         },
//         icon: workout.isFavorite
//             ? const Icon(Icons.star, color: AppColors.yellow)
//             : const Icon(Icons.star_border, color: AppColors.grey),
//       ),
//     );
//   }

//   Widget _getName(BoxConstraints constraints) {
//     return Align(
//       alignment: Alignment.centerRight,
//       child: Container(
//         padding: const EdgeInsets.only(right: 8),
//         width: constraints.maxWidth * 0.7,
//         child: Text(
//           workout.name,
//           style: AppTextStyle.semiBold16,
//           softWrap: true,
//           textAlign: TextAlign.right,
//         ),
//       ),
//     );
//   }

//   Widget _getBody(BoxConstraints constraints) => Positioned(
//         left: constraints.maxWidth * -0.25,
//         height: constraints.maxHeight * 1.5,
//         top: constraints.maxHeight * 0.1,
//         width: constraints.maxWidth * 0.8,
//         child: const BodyWidget(
//           body: Body(),
//         ),
//       );
// }
