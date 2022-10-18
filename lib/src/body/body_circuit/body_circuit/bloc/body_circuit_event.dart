part of 'body_circuit_bloc.dart';

abstract class BodyCircuitEvent extends Equatable {
  const BodyCircuitEvent();

  @override
  List<Object> get props => [];
}

class BodyCircuitLoading extends BodyCircuitEvent {
  const BodyCircuitLoading();
}

class BodyCircuitPeriodChange extends BodyCircuitEvent {
  const BodyCircuitPeriodChange({required this.period});

  final Period period;

  @override
  List<Object> get props => [period];
}
