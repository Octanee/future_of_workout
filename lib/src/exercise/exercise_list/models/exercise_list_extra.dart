import 'package:exercise_api/exercise_api.dart';
import 'package:future_of_workout/src/common.dart';
import 'package:future_of_workout/src/exercise/exercise.dart';

class ExerciseListExtra {
  ExerciseListExtra({
    this.onConfirm,
    this.selectionType = SelectionType.single,
    this.icon = const AppIcon(iconData: AppIcons.repeat),
  });

  final Future<void> Function(List<Exercise> selected)? onConfirm;
  final SelectionType selectionType;
  final AppIcon? icon;
}
