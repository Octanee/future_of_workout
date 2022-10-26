import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:future_of_workout/src/shared/shared.dart';
import 'package:measurement_repository/measurement_repository.dart';
import 'package:user_repository/user_repository.dart';

part 'body_weight_event.dart';
part 'body_weight_state.dart';

class BodyWeightBloc extends Bloc<BodyWeightEvent, BodyWeightState> {
  BodyWeightBloc({
    required MeasurementRepository measurementRepository,
    required UserRepository userRepository,
  })  : _measurementRepository = measurementRepository,
        _userRepository = userRepository,
        super(const BodyWeightState()) {
    on<BodyWeightLoading>(_onLoading);
    on<BodyWeightPeriodChange>(_onPeriodChange);
    on<BodyWeightAdd>(_onAdd);
    on<BodyWeightDelete>(_onDelete);
  }

  final MeasurementRepository _measurementRepository;
  final UserRepository _userRepository;

  Future<void> _onLoading(
    BodyWeightLoading event,
    Emitter<BodyWeightState> emit,
  ) async {
    emit(state.copyWith(status: BodyWeightStatus.loading));

    await emit.forEach<List<Measurement>>(
      _measurementRepository.getMeasurements(),
      onData: (data) {
        final list = data
            .where((element) => element.weight != null)
            .sorted((a, b) => b.date.compareTo(a.date));

        return state.copyWith(
          status: BodyWeightStatus.success,
          measurements: list,
        );
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
    final date = event.date;

    Measurement measurement;

    try {
      measurement = _measurementRepository.get(dateTime: date);
    } on MeasurementNotFoundException catch (_) {
      measurement = Measurement(date: date);
    }

    if (date.isToday()) {
      final user = _userRepository.get();
      await _userRepository.saveUser(user.copyWith(weight: event.weight));
    }

    await _measurementRepository
        .saveMeasurement(measurement.copyWith(weight: () => event.weight));
  }

  Future<void> _onDelete(
    BodyWeightDelete event,
    Emitter<BodyWeightState> emit,
  ) async {
    try {
      final item = _measurementRepository.get(dateTime: event.date);
      await _measurementRepository
          .saveMeasurement(item.copyWith(weight: () => null));
    } on MeasurementNotFoundException catch (_) {
      emit(state.copyWith(status: BodyWeightStatus.failure));
    }
  }
}
