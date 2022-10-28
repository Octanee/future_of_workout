import 'package:exercise_api/exercise_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:future_of_workout/src/styles/styles.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';

class ExerciseItem extends StatelessWidget {
  const ExerciseItem({
    required this.exercise,
    this.isSelected = false,
    this.onTap,
    this.onIconPressed,
    super.key,
  });

  final Exercise exercise;
  final VoidCallback? onTap;
  final bool isSelected;
  final VoidCallback? onIconPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: CustomCard(
        onTap: onTap,
        child: Row(
          children: [
            Row(
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    SizedBox(
                      width: 80,
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: SvgPicture.asset(
                          exercise.imagePath,
                          height: 64,
                        ),
                      ),
                    ),
                    if (isSelected)
                      const Padding(
                        padding: EdgeInsets.all(4),
                        child: AppIcon(
                          iconData: AppIcons.checkBox,
                          color: AppColors.yellow,
                        ),
                      ),
                  ],
                ),
                Text(
                  exercise.name,
                  style: AppTextStyle.bold20,
                ),
              ],
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(8),
              child: IconButton(
                onPressed: onIconPressed,
                icon: const AppIcon(iconData: AppIcons.right),
              ),
            ),
          ],
        ),
        // ),
      ),
    );
  }
}
