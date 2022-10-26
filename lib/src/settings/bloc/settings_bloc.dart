import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:measurement_repository/measurement_repository.dart';
import 'package:user_repository/user_repository.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc({
    required UserRepository userRepository,
    required MeasurementRepository measurementRepository,
  })  : _userRepository = userRepository,
        _measurementRepository = measurementRepository,
        super(const SettingsState()) {
    on<SettingsLoading>(_onLoading);
    on<SettingsChangeData>(_onChangeData);
  }

  final UserRepository _userRepository;
  final MeasurementRepository _measurementRepository;

  Future<void> _onLoading(
    SettingsLoading event,
    Emitter<SettingsState> emit,
  ) async {
    emit(state.copyWith(status: SettingsStatus.loading));

    final user = _userRepository.get();

    emit(state.copyWith(status: SettingsStatus.success, user: user));
  }

  Future<void> _onChangeData(
    SettingsChangeData event,
    Emitter<SettingsState> emit,
  ) async {
    final user = event.user;
    if (state.user!.weight != user.weight) {
      await _updateMeasurement(weight: user.weight);
    }

    await _userRepository.saveUser(user);

    emit(state.copyWith(user: user));
  }

  Future<void> _updateMeasurement({required double weight}) async {
    Measurement item;
    try {
      item = _measurementRepository.get(dateTime: DateTime.now()).copyWith(
            weight: () => weight,
          );
    } on MeasurementNotFoundException catch (_) {
      item = Measurement(date: DateTime.now());
    }

    await _measurementRepository.saveMeasurement(item);
  }
}
