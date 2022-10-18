part of 'body_circuit_details_bloc.dart';

abstract class BodyCircuitDetailsEvent extends Equatable {
  const BodyCircuitDetailsEvent();

  @override
  List<Object?> get props => [];
}

class BodyCircuitDetailsLoading extends BodyCircuitDetailsEvent {
  const BodyCircuitDetailsLoading({required this.dateTime});

  final DateTime dateTime;

  @override
  List<Object> get props => [dateTime];
}

class BodyCircuitDetailsPop extends BodyCircuitDetailsEvent {
  const BodyCircuitDetailsPop();
}

class BodyCircuitDetailsMeasurementPlaceChange extends BodyCircuitDetailsEvent {
  const BodyCircuitDetailsMeasurementPlaceChange({
    required this.place,
    required this.value,
  });

  final MeasurementPlace place;
  final double? value;

  @override
  List<Object?> get props => [place, value];
}

class BodyCircuitDetailsDelete extends BodyCircuitDetailsEvent {
  const BodyCircuitDetailsDelete();
}
