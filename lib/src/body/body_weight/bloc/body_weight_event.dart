part of 'body_weight_bloc.dart';

abstract class BodyWeightEvent extends Equatable {
  const BodyWeightEvent();

  @override
  List<Object> get props => [];
}

class BodyWeightLoading extends BodyWeightEvent {
  const BodyWeightLoading();
}

class BodyWeightPeriodChange extends BodyWeightEvent {
  const BodyWeightPeriodChange({required this.period});

  final Period period;

  @override
  List<Object> get props => [period];
}

class BodyWeightAdd extends BodyWeightEvent {
  const BodyWeightAdd({required this.date, required this.weight});

  final DateTime date;
  final double weight;

  @override
  List<Object> get props => [date, weight];
}

class BodyWeightDelete extends BodyWeightEvent {
  const BodyWeightDelete({required this.date});

  final DateTime date;

  @override
  List<Object> get props => [date];
}
