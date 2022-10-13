import 'package:exercise_api/exercise_api.dart';

class ExerciseListExtra {
  ExerciseListExtra({required this.onConfirm, this.multiSelected = true});

  final Future<void> Function(List<Exercise> selected) onConfirm;
  final bool multiSelected;
}
