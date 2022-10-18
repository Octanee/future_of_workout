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
    this.weights = const [],
    this.period = Period.oneMounth,
  });

  final BodyWeightStatus status;
  final List<MapEntry<DateTime, double>> weights;
  final Period period;

  List<MapEntry<DateTime, double>> get data {
    return weights.where((element) {
      final difference = DateTime.now().difference(element.key).inDays;
      return difference <= period.days;
    }).toList();
  }

  @override
  List<Object> get props => [status, weights, period];

  BodyWeightState copyWith({
    BodyWeightStatus? status,
    List<MapEntry<DateTime, double>>? weights,
    Period? period,
  }) {
    return BodyWeightState(
      status: status ?? this.status,
      weights: weights ?? this.weights,
      period: period ?? this.period,
    );
  }
}
