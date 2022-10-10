import 'package:flutter/material.dart';
import 'package:future_of_workout/src/styles/styles.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';
import 'package:workout_api/workout_api.dart';

class WorkoutItem extends StatelessWidget {
  const WorkoutItem({
    super.key,
    required this.workout,
    required this.onToggleFavorite,
    this.isReverse = false,
    this.onTap,
  });

  final Workout workout;
  final ValueChanged<bool> onToggleFavorite;
  final VoidCallback? onTap;
  final bool isReverse;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return CustomCard(
          key: Key('workout_log_item_${workout.id}'),
          onTap: onTap,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: _getContent(constraints.maxWidth / 2),
            ),
          ),
        );
      },
    );
  }

  List<Widget> _getContent(double size) {
    final list = [
      Align(
        alignment: isReverse ? Alignment.topRight : Alignment.topLeft,
        child: _getData(size),
      ),
      _getBody(size * 0.8),
    ];

    if (isReverse) {
      return list.reversed.toList();
    }
    return list;
  }

  Widget _getData(double size) {
    return SizedBox(
      width: size,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment:
              isReverse ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Text(workout.name, style: AppTextStyle.bold24),
            const SizedBox(height: 16),
            _buildExercises(),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  Widget _getBody(double size) {
    return BodyContainer(
      size: size,
      body: workout.body(),
    );
  }

  Widget _getFavorit() {
    return IconButton(
      padding: EdgeInsets.zero,
      icon: workout.isFavorite
          ? const Icon(Icons.star, color: AppColors.yellow)
          : const Icon(Icons.star_border, color: AppColors.grey),
      onPressed: () => onToggleFavorite(!workout.isFavorite),
    );
  }

  Widget _buildExercises() {
    final exercises = workout.workoutExercises.length;
    final text = _buildText(
      bold: '$exercises ',
      medium: 'exercises',
    );
    return _buildRow(
      text: text,
      icon: const Icon(Icons.repeat_rounded),
    );
  }

  Widget _buildRow({
    required Widget text,
    required Icon icon,
  }) {
    final children = [
      text,
      const SizedBox(width: 8),
      icon,
    ];
    return Row(
      mainAxisAlignment:
          isReverse ? MainAxisAlignment.end : MainAxisAlignment.start,
      textBaseline: TextBaseline.alphabetic,
      children: isReverse ? children : children.reversed.toList(),
    );
  }

  Widget _buildText({required String bold, String medium = ''}) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(text: bold, style: AppTextStyle.semiBold20),
          TextSpan(text: medium, style: AppTextStyle.medium16),
        ],
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return LayoutBuilder(
  //     builder: (context, constraints) => CustomCard(
  //       onTap: onTap,
  //       child: ClipRRect(
  //         borderRadius: BorderRadius.circular(16),
  //         child: Row(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: _getContent(constraints.maxWidth / 2),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // List<Widget> _getContent(double size) {
  //   return [
  //     _getBody(size),
  //     Column(
  //       crossAxisAlignment: CrossAxisAlignment.end,
  //       children: [
  //         _getFavorit(),
  //         _getName(size),
  //       ],
  //     ),
  //   ];
  // }

  // Widget _getName(double size) {
  //   return Align(
  //     alignment: Alignment.centerRight,
  //     child: Container(
  //       padding: const EdgeInsets.only(right: 8),
  //       width: size,
  //       child: Text(
  //         workout.name,
  //         style: AppTextStyle.bold20,
  //         softWrap: true,
  //         textAlign: TextAlign.right,
  //       ),
  //     ),
  //   );
  // }

  // Widget _getBody(double size) {
  //   return BodyContainer(
  //     size: size,
  //     body: workout.body(),
  //   );
  // }
}
