import 'package:measurement_api/measurement_api.dart';

/// {@template measurement_api}
/// The interface for an API that provides access to a list of Measurements.
/// {@endtemplate}
abstract class MeasurementApi {
  /// {@macro measurement_api}
  const MeasurementApi();

  /// Provides a [Stream] of all Measurements.
  Stream<List<Measurement>> getMeasurements();

  /// Get the Measurement with the given `date`.
  ///
  /// If no Measurement with the given `date` exists,
  /// a [MeasurementNotFoundException] error is thrown.
  Measurement get({required DateTime date});

  /// Saves a [Measurement].
  ///
  /// If a [Measurement] with the same `date` already exists,
  /// it will be replaced.
  Future<void> saveMeasurement(Measurement measurement);

  /// Deletes the `Measurement` with the given [date].
  ///
  /// If no Measurement with the given [date] exists,
  /// a [MeasurementNotFoundException] erros is thrown.
  Future<void> deleteMeasurement(DateTime date);
}
