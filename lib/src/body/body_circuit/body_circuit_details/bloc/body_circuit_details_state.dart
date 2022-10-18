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
  });

  final BodyCircuitDetailsStatus status;
  final Measurement? measurement;

  @override
  List<Object?> get props => [status, measurement];

  BodyCircuitDetailsState copyWith({
    BodyCircuitDetailsStatus? status,
    Measurement? measurement,
  }) {
    return BodyCircuitDetailsState(
      status: status ?? this.status,
      measurement: measurement ?? this.measurement,
    );
  }
}
