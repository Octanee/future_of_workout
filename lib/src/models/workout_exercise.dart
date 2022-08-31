import 'exercise.dart';
import 'exercise_series.dart';

class WorkoutExercise {
  final Exercise exercise;

  final List<ExerciseSeries> seriesOfExercise = [
    ExerciseSeries(),
    ExerciseSeries(),
    ExerciseSeries(),
  ];

  WorkoutExercise({required this.exercise});
}
