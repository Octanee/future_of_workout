import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:future_of_workout/src/logger.dart';
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
    on<BodyCircuitDetailsDateChange>(_onDateChange);
    on<BodyCircuitDetailsDelete>(_onDelete);
  }

  final MeasurementRepository _repository;

  void _onLoading(
    BodyCircuitDetailsLoading event,
    Emitter<BodyCircuitDetailsState> emit,
  ) {
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
        currentMeasurement: item,
      ),
    );
  }

  void _onMeasurementPlaceChange(
    BodyCircuitDetailsMeasurementPlaceChange event,
    Emitter<BodyCircuitDetailsState> emit,
  ) {
    final item = state.currentMeasurement!.copyWithPlace(
      place: event.place,
      value: event.value,
    );

    emit(state.copyWith(currentMeasurement: item));
  }

  Future<void> _onDelete(
    BodyCircuitDetailsDelete event,
    Emitter<BodyCircuitDetailsState> emit,
  ) async {
    // TODO(Octane): Hangle Delete Event
  }

  void _onDateChange(
    BodyCircuitDetailsDateChange event,
    Emitter<BodyCircuitDetailsState> emit,
  ) {
    final item = state.currentMeasurement!.copyWith(date: event.dateTime);
    emit(state.copyWith(currentMeasurement: item));
  }

  Future<void> _onPop(
    BodyCircuitDetailsPop event,
    Emitter<BodyCircuitDetailsState> emit,
  ) async {
    try {
      final current = state.currentMeasurement!;
      if (!current.hasCircuits()) {
        await _repository.deleteMeasurement(current.date);
      } else {
        final measurement = state.measurement!;
        if (measurement.date != current.date) {
          await _repository.deleteMeasurement(measurement.date);
        }
        await _repository.saveMeasurement(current);
      }
    } catch (_) {
      emit(state.copyWith(status: BodyCircuitDetailsStatus.failure));
    }
  }
}
