part of 'body_weight_bloc.dart';

enum BodyWeightStatus {
  initial,
  loading,
  success,
  failure,
}

class BodyWeightState extends Equatable {
  const BodyWeightState({
    this.status = BodyWeightStatus.initial,
    this.measurements = const [],
    this.period = Period.oneMounth,
  });

  final BodyWeightStatus status;
  final List<Measurement> measurements;
  final Period period;

  List<MapEntry<DateTime, double>> get data {
    return measurements
        .where((element) {
          final difference = DateTime.now().difference(element.date).inDays;
          return difference <= period.days;
        })
        .map<MapEntry<DateTime, double>>((e) => MapEntry(e.date, e.weight!))
        .toList();
  }

  @override
  List<Object> get props => [status, measurements, period];

  BodyWeightState copyWith({
    BodyWeightStatus? status,
    List<Measurement>? measurements,
    Period? period,
  }) {
    return BodyWeightState(
      status: status ?? this.status,
      measurements: measurements ?? this.measurements,
      period: period ?? this.period,
    );
  }
}
