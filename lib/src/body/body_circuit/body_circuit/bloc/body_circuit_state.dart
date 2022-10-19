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

  List<CircuitChange> get data {
    final measurementsInPeriod = measurements.where((element) {
      final difference = DateTime.now().difference(element.date).inDays;
      return difference <= period.days && element.hasCircuits();
    }).sorted((a, b) => a.date.compareTo(b.date));

    final list = <CircuitChange>[];

    for (final place in MeasurementPlace.values) {
      final first = measurementsInPeriod
          .firstWhereOrNull((element) => element.circuit(place: place) != null)
          ?.circuit(place: place);
      final last = measurementsInPeriod
          .lastWhereOrNull((element) => element.circuit(place: place) != null)
          ?.circuit(place: place);

      if (first != null && last != null) {
        final item = CircuitChange(
          place: place,
          firstValue: first,
          lastValue: last,
        );

        list.add(item);
      }
    }

    return list;
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
