import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:future_of_workout/src/data/models/models.dart';
import 'package:future_of_workout/src/presentation/styles/styles.dart';
import 'package:future_of_workout/src/presentation/widgets/widgets.dart';

class WorkoutExerciseItem extends StatelessWidget {
  const WorkoutExerciseItem({required this.workoutExercise, super.key});

  final WorkoutExercise workoutExercise;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                width: 80,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: SvgPicture.asset(
                    workoutExercise.exercise.imagePathStart,
                    height: 64,
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    workoutExercise.exercise.name,
                    style: AppTextStyle.bold20,
                  ),
                  Text(
                    '${workoutExercise.seriesOfExercise.length} series',
                    style: AppTextStyle.medium16,
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          const Padding(
            padding: EdgeInsets.all(8),
            child: Icon(
              Icons.more_vert_outlined,
              color: AppColors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
