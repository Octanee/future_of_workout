part of 'body_circuit_details_bloc.dart';

abstract class BodyCircuitAddEvent extends Equatable {
  const BodyCircuitAddEvent();

  @override
  List<Object?> get props => [];
}

class BodyCircuitAddLoading extends BodyCircuitAddEvent {
  const BodyCircuitAddLoading({required this.dateTime});

  final DateTime dateTime;

  @override
  List<Object> get props => [dateTime];
}

class BodyCircuitAddPop extends BodyCircuitAddEvent {
  const BodyCircuitAddPop();
}

class BodyCircuitAddMeasurementPlaceChange extends BodyCircuitAddEvent {
  const BodyCircuitAddMeasurementPlaceChange({
    required this.place,
    required this.value,
  });

  final MeasurementPlace place;
  final double? value;

  @override
  List<Object?> get props => [place, value];
}
