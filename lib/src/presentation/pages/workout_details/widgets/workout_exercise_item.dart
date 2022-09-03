import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../data/models/models.dart';
import '../../../styles/styles.dart';
import '../../../widgets/widgets.dart';

class WorkoutExerciseItem extends StatelessWidget {
  const WorkoutExerciseItem({required this.workoutExercise, Key? key})
      : super(key: key);

  final WorkoutExercise workoutExercise;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  workoutExercise.exercise.imagePathStart,
                  width: 64,
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
            padding: EdgeInsets.all(8.0),
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
