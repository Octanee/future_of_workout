import 'package:future_of_workout/src/common.dart';
import 'package:workout_api/workout_api.dart';

class WorkoutItem extends StatelessWidget {
  const WorkoutItem({
    super.key,
    required this.workout,
    this.isReverse = false,
    this.onTap,
  });

  final Workout workout;
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
              children: _getContent(constraints.maxWidth / 2, context),
            ),
          ),
        );
      },
    );
  }

  List<Widget> _getContent(double size, BuildContext context) {
    final list = [
      Align(
        alignment: isReverse ? Alignment.topRight : Alignment.topLeft,
        child: _getData(size, context),
      ),
      _getBody(size * 0.8),
    ];

    if (isReverse) {
      return list.reversed.toList();
    }
    return list;
  }

  Widget _getData(double size, BuildContext context) {
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
            _buildExercises(context),
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

  Widget _buildExercises(BuildContext context) {
    final exercises = workout.workoutExercises.length;
    final text = _buildText(
      bold: '$exercises ',
      medium: context.locale.exercisesCount(exercises),
    );
    return _buildRow(
      text: text,
      icon: const AppIcon(iconData: AppIcons.gym),
    );
  }

  Widget _buildRow({
    required Widget text,
    required Widget icon,
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
}
