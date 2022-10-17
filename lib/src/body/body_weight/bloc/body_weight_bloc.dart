import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:future_of_workout/src/period.dart';
import 'package:measurement_repository/measurement_repository.dart';

part 'body_weight_event.dart';
part 'body_weight_state.dart';

class BodyWeightBloc extends Bloc<BodyWeightEvent, BodyWeightState> {
  BodyWeightBloc({required MeasurementRepository measurementRepository})
      : _repository = measurementRepository,
        super(const BodyWeightState()) {
    on<BodyWeightLoading>(_onLoading);
    on<BodyWeightPeriodChange>(_onPeriodChange);
    on<BodyWeightAdd>(_onAdd);
    on<BodyWeightDelete>(_onDelete);
  }

  final MeasurementRepository _repository;

  Future<void> _onLoading(
    BodyWeightLoading event,
    Emitter<BodyWeightState> emit,
  ) async {
    emit(state.copyWith(status: BodyWeightStatus.loading));

    await emit.forEach<List<Measurement>>(
      _repository.getMeasurements(),
      onData: (data) {
        final list = <MapEntry<DateTime, double>>[];
        for (final element in data) {
          if (element.weight != null) {
            list.add(MapEntry(element.date, element.weight!));
          }
        }

        list.sort(
          (a, b) => b.key.compareTo(a.key),
        );
        return state.copyWith(status: BodyWeightStatus.success, weights: list);
      },
      onError: (_, __) => state.copyWith(status: BodyWeightStatus.failure),
    );
  }

  void _onPeriodChange(
    BodyWeightPeriodChange event,
    Emitter<BodyWeightState> emit,
  ) {
    emit(state.copyWith(period: event.period));
  }

  Future<void> _onAdd(
    BodyWeightAdd event,
    Emitter<BodyWeightState> emit,
  ) async {
    Measurement measurement;

    try {
      measurement = _repository.get(dateTime: event.date);
    } on MeasurementNotFoundException catch (_) {
      measurement = Measurement(date: event.date);
    }

    await _repository
        .saveMeasurement(measurement.copyWith(weight: event.weight));
  }

  Future<void> _onDelete(
    BodyWeightDelete event,
    Emitter<BodyWeightState> emit,
  ) async {
    try {
      await _repository.deleteMeasurement(event.date);
    } on MeasurementNotFoundException catch (_) {
      emit(state.copyWith(status: BodyWeightStatus.failure));
    }
  }
}
