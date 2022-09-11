import 'package:flutter/material.dart';
import 'package:future_of_workout/src/styles/styles.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';
import 'package:workout_api/workout_api.dart';

class WorkoutItem extends StatelessWidget {
  const WorkoutItem({
    super.key,
    required this.workout,
    required this.onToggleFavorite,
    required this.onTap,
  });

  final Workout workout;
  final ValueChanged<bool> onToggleFavorite;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => CustomCard(
        onTap: onTap,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            children: [
              _getFavorit(constraints, context),
              _getBody(constraints),
              _getName(constraints),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getFavorit(BoxConstraints constraints, BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: IconButton(
        onPressed: () => onToggleFavorite(!workout.isFavorite),
        icon: workout.isFavorite
            ? const Icon(Icons.star, color: AppColors.yellow)
            : const Icon(Icons.star_border, color: AppColors.grey),
      ),
    );
  }

  Widget _getName(BoxConstraints constraints) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.only(right: 8),
        width: constraints.maxWidth * 0.7,
        child: Text(
          workout.name,
          style: AppTextStyle.semiBold16,
          softWrap: true,
          textAlign: TextAlign.right,
        ),
      ),
    );
  }

  Widget _getBody(BoxConstraints constraints) => Positioned(
        left: constraints.maxWidth * -0.25,
        height: constraints.maxHeight * 1.5,
        top: 0,
        width: constraints.maxWidth * 0.8,
        child: const DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.yellow,
          ),
          // TODO(Octane): Display body SVG
        ),
      );
}
