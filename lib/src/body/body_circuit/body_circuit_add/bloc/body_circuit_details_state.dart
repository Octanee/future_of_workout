part of 'body_circuit_details_bloc.dart';

enum BodyCircuitDetailsStatus {
  initial,
  loading,
  success,
  failure,
}

class BodyCircuitAddState extends Equatable {
  const BodyCircuitAddState({
    this.status = BodyCircuitDetailsStatus.initial,
    this.measurement,
  });

  final BodyCircuitDetailsStatus status;
  final Measurement? measurement;

  @override
  List<Object?> get props => [status, measurement];

  BodyCircuitAddState copyWith({
    BodyCircuitDetailsStatus? status,
    Measurement? measurement,
  }) {
    return BodyCircuitAddState(
      status: status ?? this.status,
      measurement: measurement ?? this.measurement,
    );
  }
}
