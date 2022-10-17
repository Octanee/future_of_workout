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
  double? circuit({required MeasurementPlace place}) =>
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
      neckCircuit: neckCircuit ?? circuit(place: MeasurementPlace.neck),
      chestCircuit: chestCircuit ?? circuit(place: MeasurementPlace.chest),
      bicepsCircuit:
          bicepsCircuit ?? circuit(place: MeasurementPlace.biceps),
      waistCircuit: waistCircuit ?? circuit(place: MeasurementPlace.waist),
      bellyCircuit: bellyCircuit ?? circuit(place: MeasurementPlace.belly),
      hipCircuit: hipCircuit ?? circuit(place: MeasurementPlace.hip),
      calfCircuit: calfCircuit ?? circuit(place: MeasurementPlace.calf),
    );
  }

  @override
  List<Object?> get props => [date, weight, _bodyCircuits];
}
