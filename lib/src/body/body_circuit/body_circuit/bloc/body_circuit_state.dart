part of 'body_circuit_bloc.dart';

enum BodyCircuitStatus {
  initial,
  loading,
  success,
  failure,
}

class BodyCircuitState extends Equatable {
  const BodyCircuitState({
    this.status = BodyCircuitStatus.initial,
    this.measurements = const [],
    this.period = Period.oneMounth,
  });

  final BodyCircuitStatus status;
  final List<Measurement> measurements;
  final Period period;

  List<Measurement> get data {
    return measurements.where((element) {
      final difference = DateTime.now().difference(element.date).inDays;
      return difference <= period.days && element.hasCircuits();
    }).toList();
  }

  @override
  List<Object> get props => [status, measurements, period];

  BodyCircuitState copyWith({
    BodyCircuitStatus? status,
    List<Measurement>? measurements,
    Period? period,
  }) {
    return BodyCircuitState(
      status: status ?? this.status,
      measurements: measurements ?? this.measurements,
      period: period ?? this.period,
    );
  }
}
