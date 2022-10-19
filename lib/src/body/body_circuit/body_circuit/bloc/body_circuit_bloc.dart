import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:future_of_workout/src/body/body_circuit/body_circuit/body_circuit.dart';
import 'package:future_of_workout/src/period.dart';
import 'package:measurement_repository/measurement_repository.dart';

part 'body_circuit_event.dart';
part 'body_circuit_state.dart';

class BodyCircuitBloc extends Bloc<BodyCircuitEvent, BodyCircuitState> {
  BodyCircuitBloc({required MeasurementRepository measurementRepository})
      : _repository = measurementRepository,
        super(const BodyCircuitState()) {
    on<BodyCircuitLoading>(_onLoading);
    on<BodyCircuitPeriodChange>(_onPeriodChange);
  }

  final MeasurementRepository _repository;

  Future<void> _onLoading(
    BodyCircuitLoading event,
    Emitter<BodyCircuitState> emit,
  ) async {
    emit(state.copyWith(status: BodyCircuitStatus.loading));

    await emit.forEach<List<Measurement>>(
      _repository.getMeasurements(),
      onData: (data) {
        final list = List.of(data)
          ..sort(
            (a, b) => b.date.compareTo(a.date),
          );

        return state.copyWith(
          status: BodyCircuitStatus.success,
          measurements: list,
        );
      },
      onError: (_, __) => state.copyWith(status: BodyCircuitStatus.failure),
    );
  }

  void _onPeriodChange(
    BodyCircuitPeriodChange event,
    Emitter<BodyCircuitState> emit,
  ) {
    emit(state.copyWith(period: event.period));
  }
}
