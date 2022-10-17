import 'package:equatable/equatable.dart';
import 'package:measurement_api/measurement_api.dart';

/// {@template measurement}
/// A single item of measurement.
/// {@endtemplate}
class Measurement extends Equatable {
  /// {@macro measurement}
  Measurement({
    DateTime? date,
    this.weight,
    double? neckCircuit,
    double? chestCircuit,
    double? bicepsCircuit,
    double? waistCircuit,
    double? bellyCircuit,
    double? hipCircuit,
    double? thighCircuit,
    double? calfCircuit,
  })  : date = date ?? DateTime.now(),
        _bodyCircuits = {
          MeasurementPlace.neck: neckCircuit,
          MeasurementPlace.chest: chestCircuit,
          MeasurementPlace.biceps: bicepsCircuit,
          MeasurementPlace.waist: waistCircuit,
          MeasurementPlace.belly: bellyCircuit,
          MeasurementPlace.hip: hipCircuit,
          MeasurementPlace.thigh: thighCircuit,
          MeasurementPlace.calf: calfCircuit,
        };

  /// Date when the measurements were taken.
  final DateTime date;

  /// The weight of user;
  final double? weight;

  final Map<MeasurementPlace, double?> _bodyCircuits;

  /// Return value of measurement in specific place.
  double? measurement({required MeasurementPlace place}) =>
      _bodyCircuits[place];

  /// Copy instance with given values.
  ///
  /// {@macro body}
  Measurement copyWith({
    DateTime? date,
    double? weight,
    double? neckCircuit,
    double? chestCircuit,
    double? bicepsCircuit,
    double? waistCircuit,
    double? bellyCircuit,
    double? hipCircuit,
    double? thighCircuit,
    double? calfCircuit,
  }) {
    return Measurement(
      date: date ?? this.date,
      weight: weight ?? this.weight,
      neckCircuit: neckCircuit ?? measurement(place: MeasurementPlace.neck),
      chestCircuit: chestCircuit ?? measurement(place: MeasurementPlace.chest),
      bicepsCircuit:
          bicepsCircuit ?? measurement(place: MeasurementPlace.biceps),
      waistCircuit: waistCircuit ?? measurement(place: MeasurementPlace.waist),
      bellyCircuit: bellyCircuit ?? measurement(place: MeasurementPlace.belly),
      hipCircuit: hipCircuit ?? measurement(place: MeasurementPlace.hip),
      calfCircuit: calfCircuit ?? measurement(place: MeasurementPlace.calf),
    );
  }

  @override
  List<Object?> get props => [date, weight, _bodyCircuits];
}
