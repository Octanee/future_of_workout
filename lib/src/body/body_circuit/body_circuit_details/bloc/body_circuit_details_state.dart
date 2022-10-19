part of 'body_circuit_details_bloc.dart';

enum BodyCircuitDetailsStatus {
  initial,
  loading,
  success,
  failure,
}

class BodyCircuitDetailsState extends Equatable {
  const BodyCircuitDetailsState({
    this.status = BodyCircuitDetailsStatus.initial,
    this.measurementPlace,
    this.measurements = const [],
    this.period = Period.oneMounth,
  });

  final BodyCircuitDetailsStatus status;
  final MeasurementPlace? measurementPlace;
  final List<Measurement> measurements;
  final Period period;

  List<MapEntry<DateTime, double>> get data {
    return measurements
        .where((element) {
          final difference = DateTime.now().difference(element.date).inDays;
          final hasCircut = element.circuit(place: measurementPlace!) != null;
          return difference <= period.days && hasCircut;
        })
        .map<MapEntry<DateTime, double>>(
          (e) => MapEntry(e.date, e.circuit(place: measurementPlace!)!),
        )
        .toList();
  }

  @override
  List<Object?> get props => [status, measurements, measurementPlace, period];

  BodyCircuitDetailsState copyWith({
    BodyCircuitDetailsStatus? status,
    MeasurementPlace? measurementPlace,
    List<Measurement>? measurements,
    Period? period,
  }) {
    return BodyCircuitDetailsState(
      status: status ?? this.status,
      measurementPlace: measurementPlace ?? this.measurementPlace,
      measurements: measurements ?? this.measurements,
      period: period ?? this.period,
    );
  }
}
