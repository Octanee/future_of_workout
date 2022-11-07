import 'dart:math';

import 'package:exercise_api/exercise_api.dart';

/// {@template default_exercise_provider}
/// Provider of default [Exercise]s.
/// {@endtemplate}
class DefaultExerciseProvider {
  /// Static list of default [Exercise]s.
  static final List<Exercise> defaultExercises = [
    ..._generate,
    _barbellBenchPress,
    _squat,
    _deadlift,
  ];

  static List<Exercise> get _generate =>
      DefaultExercise.values.map<Exercise>((exercise) {
        var name = exercise.name.replaceAllMapped(
          RegExp('([A-Z])'),
          (match) => ' ${match.group(1)}',
        );

        name = '${name[0].toUpperCase()}${name.substring(1).toLowerCase()}';

        return Exercise(
          id: exercise.name,
          name: name,
          primaryMuscle: Muscle.values[Random().nextInt(Muscle.values.length)],
          muscles: const {},
        );
      }).toList();

  static Exercise get _barbellBenchPress => Exercise(
        id: DefaultExercise.benchPress.name,
        name: 'Bench press',
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

  static Exercise get _squat => Exercise(
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

  static Exercise get _deadlift => Exercise(
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
