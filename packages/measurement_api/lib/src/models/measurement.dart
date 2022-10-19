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
  double? circuit({required MeasurementPlace place}) => _bodyCircuits[place];

  /// Return `true` when any circuits its added.
  bool hasCircuits() {
    return _bodyCircuits.values.any((element) => element != null);
  }

  /// Copy instance with given values.
  ///
  /// {@macro body}
  Measurement copyWith({
    DateTime? date,
    double? Function()? weight,
    double? Function()? neckCircuit,
    double? Function()? chestCircuit,
    double? Function()? bicepsCircuit,
    double? Function()? waistCircuit,
    double? Function()? bellyCircuit,
    double? Function()? hipCircuit,
    double? Function()? thighCircuit,
    double? Function()? calfCircuit,
  }) {
    return Measurement(
      date: date ?? this.date,
      weight: weight != null ? weight() : this.weight,
      neckCircuit: neckCircuit != null
          ? neckCircuit()
          : circuit(place: MeasurementPlace.neck),
      chestCircuit: chestCircuit != null
          ? chestCircuit()
          : circuit(place: MeasurementPlace.chest),
      bicepsCircuit: bicepsCircuit != null
          ? bicepsCircuit()
          : circuit(place: MeasurementPlace.biceps),
      waistCircuit: waistCircuit != null
          ? waistCircuit()
          : circuit(place: MeasurementPlace.waist),
      bellyCircuit: bellyCircuit != null
          ? bellyCircuit()
          : circuit(place: MeasurementPlace.belly),
      hipCircuit: hipCircuit != null
          ? hipCircuit()
          : circuit(place: MeasurementPlace.hip),
      thighCircuit: thighCircuit != null
          ? thighCircuit()
          : circuit(place: MeasurementPlace.thigh),
      calfCircuit: calfCircuit != null
          ? calfCircuit()
          : circuit(place: MeasurementPlace.calf),
    );
  }

  /// Copy instance with given value of place.
  ///
  /// {@macro body}
  Measurement copyWithPlace({
    required MeasurementPlace place,
    double? value,
  }) {
    switch (place) {
      case MeasurementPlace.neck:
        return copyWith(neckCircuit: () => value);
      case MeasurementPlace.chest:
        return copyWith(chestCircuit: () => value);
      case MeasurementPlace.biceps:
        return copyWith(bicepsCircuit: () => value);
      case MeasurementPlace.waist:
        return copyWith(waistCircuit: () => value);
      case MeasurementPlace.belly:
        return copyWith(bellyCircuit: () => value);
      case MeasurementPlace.hip:
        return copyWith(hipCircuit: () => value);
      case MeasurementPlace.thigh:
        return copyWith(thighCircuit: () => value);
      case MeasurementPlace.calf:
        return copyWith(calfCircuit: () => value);
    }
  }

  @override
  List<Object?> get props => [date, weight, _bodyCircuits];
}
