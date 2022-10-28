import 'package:future_of_workout/src/shared/logger.dart';
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

    logger.i({
      'finished': finished,
      'met': met,
      'time': time,
      'calories': calories,
    });

    return calories.round();
  }
}
