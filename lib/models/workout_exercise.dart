import 'exercise_series.dart';

class WorkoutExercise {
  final String exerciseId;
  final String exerciseName;
  final List<ExerciseSeries> seriesOfExercise = [
    ExerciseSeries(),
    ExerciseSeries(),
    ExerciseSeries(),
  ];

  WorkoutExercise({
    required this.exerciseId,
    required this.exerciseName,
  });
}
