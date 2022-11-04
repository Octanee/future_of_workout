import 'package:workout_log_repository/workout_log_repository.dart';

class CaloriesCalculator {
  const CaloriesCalculator._();

  static int inWorkout({
    required double userWeight,
    required WorkoutLog workout,
  }) {
    final finished = <ExerciseSeriesLog>[];

    for (final exercise in workout.workoutExerciseLogs) {
      final series =
          exercise.exerciseSeriesLogs.where((series) => series.isFinished);

      finished.addAll(series);
    }

    if (finished.isEmpty) {
      return 0;
    }

    final intensity = finished
            .map((series) => series.intensity.value)
            .reduce((value, element) => value + element) /
        finished.length;

    final met = intensity * 10;

    final time = finished
            .map((series) => series.rest)
            .reduce((value, element) => value + element) /
        60;

    final calories = (time * met * userWeight) / 200;

    return calories.round();
  }
}
