import 'dart:developer';

import 'package:body_api/src/models/muscle.dart';

/// Helper class to calculate a involvement for the muscle.
class InvolvementCalculator {
  const InvolvementCalculator._();

  /// Calculate involvement
  ///
  /// MuscleInvolvement -> SeriesIntensity -> number of series
  static int calculate({
    required Muscle muscle,
    required Map<double, Map<double, int>> data,
  }) {
    var involvement = 0.0;

    data.forEach((muscleInvolvement, series) {
      series.forEach((seriesIntensity, value) {
        involvement += muscleInvolvement * seriesIntensity * value;
      });
    });

    log('InvolvementCalculator -> involvement { $involvement }');

    final value = involvement / (muscle.maximumRecoverableVolume / 2) * 100;

    return value.toInt();
  }
}
