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
      id: DefaultExercise.barbellBenchPress.name,
      name: 'Barbell bench press',
      primaryMuscle: Muscle.chest,
      muscles: const {
        Muscle.chest: MuscleInvolvement.primary,
        Muscle.triceps: MuscleInvolvement.secondary,
        Muscle.shoulders: MuscleInvolvement.additional,
      },
      imagePath:
          'assets/exercises/barbel_bench_press/barbel_bench_press_start.svg',
      imagePathSecondary:
          'assets/exercises/barbel_bench_press/barbel_bench_press_end.svg',
    );
  }

  static Exercise _squat() {
    return Exercise(
      id: DefaultExercise.squat.name,
      name: 'Squat',
      muscles: const {
        Muscle.quadriceps: MuscleInvolvement.primary,
        Muscle.glutes: MuscleInvolvement.secondary,
        Muscle.hamstering: MuscleInvolvement.additional,
      },
      primaryMuscle: Muscle.quadriceps,
      imagePath: 'assets/exercises/squat/squat_end.svg',
      imagePathSecondary: 'assets/exercises/squat/squat_start.svg',
    );
  }

  static Exercise _deadlift() {
    return Exercise(
      id: DefaultExercise.deadlift.name,
      name: 'Deadlift',
      primaryMuscle: Muscle.quadriceps,
      muscles: const {
        Muscle.hamstering: MuscleInvolvement.primary,
        Muscle.glutes: MuscleInvolvement.secondary,
        Muscle.erectorSpinae: MuscleInvolvement.secondary,
      },
      imagePath: 'assets/exercises/deadlift/deadlift_start.svg',
      imagePathSecondary: 'assets/exercises/deadlift/deadlift_end.svg',
    );
  }
}

///
enum DefaultExercise {
  /// Barbell Bench Press
  barbellBenchPress,

  /// Squat
  squat,

  /// Deadlift
  deadlift,
}
