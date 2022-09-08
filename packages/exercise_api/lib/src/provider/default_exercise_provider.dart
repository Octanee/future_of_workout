import 'package:exercise_api/exercise_api.dart';

/// {@template default_exercise_provider}
/// Provider of default [Exercise]s.
/// {@endtemplate}
class DefaultExerciseProvider {
  /// Static list of default [Exercise]s.
  static final List<Exercise> defaultExercises = [
    _barbellBenchPress(),
    _squat(),
    _deadlift(),
  ];

  static Exercise _barbellBenchPress() {
    return Exercise(
      name: 'Barbell bench press',
      primaryMuscle: Muscle.chest,
      imagePath:
          'assets/exercises/barbel_bench_press/barbel_bench_press_start.svg',
      imagePathSecondary:
          'assets/exercises/barbel_bench_press/barbel_bench_press_end.svg',
    );
  }

  static Exercise _squat() {
    return Exercise(
      name: 'Squat',
      primaryMuscle: Muscle.quadriceps,
      imagePath: 'assets/exercises/squat/squat_end.svg',
      imagePathSecondary: 'assets/exercises/squat/squat_start.svg',
    );
  }

  static Exercise _deadlift() {
    return Exercise(
      name: 'Deadlift',
      primaryMuscle: Muscle.quadriceps,
      imagePath: 'assets/exercises/deadlift/deadlift_start.svg',
      imagePathSecondary: 'assets/exercises/deadlift/deadlift_end.svg',
    );
  }
}
