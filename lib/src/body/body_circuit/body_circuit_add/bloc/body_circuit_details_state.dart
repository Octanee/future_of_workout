part of 'body_circuit_details_bloc.dart';

enum BodyCircuitAddStatus {
  initial,
  loading,
  success,
  failure,
}

class BodyCircuitAddState extends Equatable {
  const BodyCircuitAddState({
    this.status = BodyCircuitAddStatus.initial,
    this.measurement,
  });

  final BodyCircuitAddStatus status;
  final Measurement? measurement;

  @override
  List<Object?> get props => [status, measurement];

  BodyCircuitAddState copyWith({
    BodyCircuitAddStatus? status,
    Measurement? measurement,
  }) {
    return BodyCircuitAddState(
      status: status ?? this.status,
      measurement: measurement ?? this.measurement,
    );
  }
}
