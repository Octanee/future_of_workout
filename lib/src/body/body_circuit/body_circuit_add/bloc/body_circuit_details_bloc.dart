import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:measurement_repository/measurement_repository.dart';

part 'body_circuit_details_event.dart';
part 'body_circuit_details_state.dart';

class BodyCircuitAddBloc
    extends Bloc<BodyCircuitAddEvent, BodyCircuitAddState> {
  BodyCircuitAddBloc({required MeasurementRepository measurementRepository})
      : _repository = measurementRepository,
        super(const BodyCircuitAddState()) {
    on<BodyCircuitAddLoading>(_onLoading);
    on<BodyCircuitAddPop>(_onPop);
    on<BodyCircuitAddMeasurementPlaceChange>(_onMeasurementPlaceChange);
  }

  final MeasurementRepository _repository;

  void _onLoading(
    BodyCircuitAddLoading event,
    Emitter<BodyCircuitAddState> emit,
  ) {
    emit(state.copyWith(status: BodyCircuitAddStatus.loading));

    Measurement item;

    try {
      item = _repository.get(dateTime: event.dateTime);
    } on MeasurementNotFoundException catch (_) {
      item = Measurement(date: event.dateTime);
    }

    emit(
      state.copyWith(
        status: BodyCircuitAddStatus.success,
        measurement: item,
      ),
    );
  }

  void _onMeasurementPlaceChange(
    BodyCircuitAddMeasurementPlaceChange event,
    Emitter<BodyCircuitAddState> emit,
  ) {
    final item = state.measurement!.copyWithPlace(
      place: event.place,
      value: event.value,
    );

    emit(state.copyWith(measurement: item));
  }

  Future<void> _onPop(
    BodyCircuitAddPop event,
    Emitter<BodyCircuitAddState> emit,
  ) async {
    try {
      final measurement = state.measurement!;

      await _repository.saveMeasurement(measurement);
    } catch (_) {
      emit(state.copyWith(status: BodyCircuitAddStatus.failure));
    }
  }
}
