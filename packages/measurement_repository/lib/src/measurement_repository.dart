import 'package:measurement_api/measurement_api.dart';

/// {@template Measurement_repository}
/// A repository that handles exercise related requests.
/// {@endtemplate}
class MeasurementRepository {
  /// {@macro Measurement_repository}
  const MeasurementRepository({required MeasurementApi measurementApi})
      : _measurementApi = measurementApi;

  final MeasurementApi _measurementApi;

  /// Provides a [Stream] of all Measurements
  Stream<List<Measurement>> getMeasurements() =>
      _measurementApi.getMeasurements();

  /// Get the Measurement with the given `dateTime`.
  ///
  /// If no Measurement with the given `dateTime` exists,
  /// a [MeasurementNotFoundException] error is thrown.
  Measurement get({required DateTime dateTime}) =>
      _measurementApi.get(date: dateTime);

  /// Saves a [Measurement].
  ///
  /// If a [Measurement] with the same `date` already exists,
  /// it will be replaced.
  Future<void> saveMeasurement(Measurement measurement) =>
      _measurementApi.saveMeasurement(measurement);

  /// Deletes the [Measurement] with the given [dateTime].
  ///
  /// If no Measurement with the given [dateTime] exists,
  /// a [MeasurementNotFoundException] erros is thrown.
  Future<void> deleteMeasurement(DateTime dateTime) =>
      _measurementApi.deleteMeasurement(dateTime);
}
