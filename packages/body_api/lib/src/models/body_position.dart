import 'dart:developer';

import 'package:body_api/body_api.dart';

/// Different body positions
enum BodyPosition {
  /// Full body of front muscles.
  front(
    muscles: [
      Muscle.neck,
      Muscle.abs,
      Muscle.biceps,
      Muscle.chest,
      Muscle.obliques,
      Muscle.serratus,
      Muscle.shoulders,
      Muscle.trapezius,
      Muscle.forearm,
      Muscle.abductors,
      Muscle.adductors,
      Muscle.calf,
      Muscle.quadriceps,
    ],
  ),

  /// Upper body from the front.
  frontUpper(
    muscles: [
      Muscle.neck,
      Muscle.abs,
      Muscle.biceps,
      Muscle.chest,
      Muscle.obliques,
      Muscle.serratus,
      Muscle.shoulders,
      Muscle.trapezius,
      Muscle.forearm,
    ],
  ),

  /// Lower body from the front.
  frontLower(
    muscles: [
      Muscle.abductors,
      Muscle.adductors,
      Muscle.calf,
      Muscle.quadriceps,
    ],
  ),

  /// Full body of back muscles.
  back(
    muscles: [
      Muscle.forearm,
      Muscle.neck,
      Muscle.erectorSpinae,
      Muscle.lattisimus,
      Muscle.obliques,
      Muscle.shoulders,
      Muscle.teresMajor,
      Muscle.trapezius,
      Muscle.triceps,
      Muscle.abductors,
      Muscle.adductors,
      Muscle.calf,
      Muscle.glutes,
      Muscle.hamstering,
    ],
  ),

  /// Upper body from the back.
  backUpper(
    muscles: [
      Muscle.forearm,
      Muscle.neck,
      Muscle.erectorSpinae,
      Muscle.lattisimus,
      Muscle.obliques,
      Muscle.shoulders,
      Muscle.teresMajor,
      Muscle.trapezius,
      Muscle.triceps,
    ],
  ),

  /// Lower body from the back.
  backLower(
    muscles: [
      Muscle.abductors,
      Muscle.adductors,
      Muscle.calf,
      Muscle.glutes,
      Muscle.hamstering,
    ],
  );

  /// Construcor
  const BodyPosition({this.muscles = const []});

  /// List of muscle groups visible in specific position.
  final List<Muscle> muscles;

  /// The function returns the number of muscles 
  /// that belong to a given body position.
  int contains({required Iterable<Muscle> muscles}) {
    return this.muscles.fold<int>(
          0,
          (previousValue, muscle) =>
              muscles.contains(muscle) ? previousValue + 1 : previousValue,
        );
  }
}
