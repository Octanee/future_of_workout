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
    this.measurement,
    this.currentMeasurement,
  });

  final BodyCircuitDetailsStatus status;
  final Measurement? measurement;
  final Measurement? currentMeasurement;

  @override
  List<Object?> get props => [status, measurement, currentMeasurement];

  BodyCircuitDetailsState copyWith({
    BodyCircuitDetailsStatus? status,
    Measurement? measurement,
    Measurement? currentMeasurement,
  }) {
    return BodyCircuitDetailsState(
      status: status ?? this.status,
      measurement: measurement ?? this.measurement,
      currentMeasurement: currentMeasurement ?? this.currentMeasurement,
    );
  }
}
