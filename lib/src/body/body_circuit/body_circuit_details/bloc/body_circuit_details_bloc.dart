import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:measurement_repository/measurement_repository.dart';

part 'body_circuit_details_event.dart';
part 'body_circuit_details_state.dart';

class BodyCircuitDetailsBloc
    extends Bloc<BodyCircuitDetailsEvent, BodyCircuitDetailsState> {
  BodyCircuitDetailsBloc({required MeasurementRepository measurementRepository})
      : _repository = measurementRepository,
        super(const BodyCircuitDetailsState()) {
    on<BodyCircuitDetailsLoading>(_onLoading);
    on<BodyCircuitDetailsPop>(_onPop);
    on<BodyCircuitDetailsMeasurementPlaceChange>(_onMeasurementPlaceChange);
    on<BodyCircuitDetailsDelete>(_onDelete);
  }

  final MeasurementRepository _repository;

  FutureOr<void> _onLoading(
    BodyCircuitDetailsLoading event,
    Emitter<BodyCircuitDetailsState> emit,
  ) async {
    emit(state.copyWith(status: BodyCircuitDetailsStatus.loading));

    Measurement item;

    try {
      item = _repository.get(dateTime: event.dateTime);
    } on MeasurementNotFoundException catch (_) {
      item = Measurement(date: event.dateTime);
    }

    emit(
      state.copyWith(
        status: BodyCircuitDetailsStatus.success,
        measurement: item,
      ),
    );
  }

  Future<void> _onPop(
    BodyCircuitDetailsPop event,
    Emitter<BodyCircuitDetailsState> emit,
  ) async {
    // TODO(Octane): Hangle Pop Event
  }

  void _onMeasurementPlaceChange(
    BodyCircuitDetailsMeasurementPlaceChange event,
    Emitter<BodyCircuitDetailsState> emit,
  ) {
    final item = state.measurement!.copyWithPlace(
      place: event.place,
      value: event.value,
    );

    emit(state.copyWith(measurement: item));
  }

  Future<void> _onDelete(
    BodyCircuitDetailsDelete event,
    Emitter<BodyCircuitDetailsState> emit,
  ) async {
    // TODO(Octane): Hangle Delete Event
  }
}
