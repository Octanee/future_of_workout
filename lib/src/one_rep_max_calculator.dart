import 'package:workout_log_repository/workout_log_repository.dart';

class OneRepMaxCalculator {
  const OneRepMaxCalculator._();

  static double calculate({
    required int reps,
    required double weight,
    required SeriesLogIntensity intensity,
  }) {
    final maxReps = _getMaxReps(intensity: intensity, reps: reps);
    final percentage = _getPercentage(maxReps: maxReps);

    return weight * 1 / percentage;
  }

  static double _getPercentage({required int maxReps}) {
    switch (maxReps) {
      case 2:
        return 0.97;
      case 3:
        return 0.94;
      case 4:
        return 0.92;
      case 5:
        return 0.89;
      case 6:
        return 0.86;
      case 7:
        return 0.83;
      case 8:
        return 0.81;
      case 9:
        return 0.78;
      case 10:
        return 0.75;
      case 11:
        return 0.73;
      case 12:
        return 0.71;
      case 13:
        return 0.70;
      case 14:
        return 0.68;
      case 15:
        return 0.67;
      case 16:
        return 0.65;
      case 17:
        return 0.64;
      case 18:
        return 0.63;
      case 19:
        return 0.61;
      case 20:
        return 0.60;
      case 21:
        return 0.59;
      case 22:
        return 0.58;
      case 23:
        return 0.57;
      case 24:
        return 0.56;
      case 25:
        return 0.55;
      case 26:
        return 0.54;
      case 27:
        return 0.53;
      case 28:
        return 0.52;
      case 29:
        return 0.51;
      case 30:
        return 0.5;
    }
    return 1;
  }

  static int _getMaxReps({
    required int reps,
    required SeriesLogIntensity intensity,
  }) {
    switch (intensity) {
      case SeriesLogIntensity.veryLight:
        return reps + 6;
      case SeriesLogIntensity.light:
        return reps + 4;
      case SeriesLogIntensity.moderate:
        return reps + 2;
      case SeriesLogIntensity.vigorous:
        return reps + 1;
      case SeriesLogIntensity.maximum:
        return reps;
      case SeriesLogIntensity.tooMuch:
        return reps - 1;
    }
  }
}
