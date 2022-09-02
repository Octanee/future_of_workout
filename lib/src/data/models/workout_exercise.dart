import 'exercise.dart';
import 'exercise_series.dart';

class WorkoutExercise {
  const WorkoutExercise({
    required this.exercise,
    this.seriesOfExercise = const [
      ExerciseSeries(),
      ExerciseSeries(),
      ExerciseSeries(),
    ],
  });

  final Exercise exercise;

  final List<ExerciseSeries> seriesOfExercise;
}
