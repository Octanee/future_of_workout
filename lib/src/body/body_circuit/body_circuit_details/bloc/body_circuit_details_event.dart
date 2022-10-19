part of 'body_circuit_details_bloc.dart';

abstract class BodyCircuitDetailsEvent extends Equatable {
  const BodyCircuitDetailsEvent();

  @override
  List<Object> get props => [];
}

class BodyCircuitDetailsLoading extends BodyCircuitDetailsEvent {
  const BodyCircuitDetailsLoading({required this.name});

  final String name;

  @override
  List<Object> get props => [name];
}

class BodyCircuitDetailsPeriodChange extends BodyCircuitDetailsEvent {
  const BodyCircuitDetailsPeriodChange({required this.period});

  final Period period;

  @override
  List<Object> get props => [period];
}
