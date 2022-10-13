import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:future_of_workout/src/styles/app_text_style.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';
import 'package:goal_repository/goal_repository.dart';

class GoalItem extends StatelessWidget {
  const GoalItem({required this.goal, super.key});

  final Goal goal;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: CustomCard(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
            child: Column(
              children: [
                _getImages(width / 4),
                const SizedBox(height: 16),
                Text(
                  goal.exercise.name,
                  style: AppTextStyle.bold20,
                ),
                const SizedBox(height: 8),
                _getText(),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _getText() {
    return Row(
      textBaseline: TextBaseline.ideographic,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          'Goal:',
          style: AppTextStyle.medium16,
        ),
        Row(
          textBaseline: TextBaseline.ideographic,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          children: [
            Text(
              '${goal.goal}',
              style: AppTextStyle.semiBold20,
            ),
            Text(
              'kg',
              style: AppTextStyle.medium16,
            ),
          ],
        ),
      ],
    );
  }

  Widget _getImages(double width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          goal.exercise.imagePath,
          width: width,
        ),
        const SizedBox(width: 8),
        SvgPicture.asset(
          goal.exercise.imagePathSecondary,
          width: width,
        ),
      ],
    );
  }
}
