import 'package:exercise_api/exercise_api.dart';
import 'package:flutter/material.dart';
import 'package:future_of_workout/src/styles/styles.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';

class MuscleItem extends StatelessWidget {
  const MuscleItem({
    required this.muscle,
    this.padding = const EdgeInsets.symmetric(vertical: 8),
    super.key,
  });

  final Muscle muscle;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: CustomCard(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  muscle.name,
                  style: AppTextStyle.medium16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
