import 'package:future_of_workout/src/common.dart';
import 'package:intl/intl.dart';
import 'package:workout_log_api/workout_log_api.dart';

class WorkoutLogItem extends StatelessWidget {
  const WorkoutLogItem({
    super.key,
    required this.log,
    this.isReverse = false,
    this.onTap,
  });

  final WorkoutLog log;
  final bool isReverse;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return CustomCard(
          key: Key('workout_log_item_${log.id}'),
          onTap: onTap,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Row(
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
      _getBody(size),
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
          crossAxisAlignment:
              isReverse ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Text(log.name, style: AppTextStyle.bold24),
            const SizedBox(height: 16),
            _buildDate(context),
            const SizedBox(height: 8),
            _buildTime(),
            const SizedBox(height: 8),
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
      body: log.body(),
    );
  }

  Widget _buildDate(BuildContext context) {
    final formatter = DateFormat(
      'dd MMM',
      context.languageCode,
    );

    final text = BoldText(
      boldText: formatter.format(log.startDate),
    );
    return _buildRow(
      text: text,
      icon: const AppIcon(iconData: AppIcons.calendar),
    );
  }

  Widget _buildTime() {
    final time = log.endDate!.difference(log.startDate);

    final text = BoldText(
      boldText: '${time.inMinutes} ',
      mediumText: 'min',
    );
    return _buildRow(
      text: text,
      icon: const AppIcon(iconData: AppIcons.clock),
    );
  }

  Widget _buildExercises(BuildContext context) {
    final exercises = log.workoutExerciseLogs
        .where(
          (exercise) =>
              exercise.exerciseSeriesLogs.any((series) => series.isFinished),
        )
        .toList()
        .length;
    final text = BoldText(
      boldText: '$exercises ',
      mediumText: context.locale.exercisesCount(exercises),
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
}
