import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:future_of_workout/src/shared/shared.dart';
import 'package:measurement_repository/measurement_repository.dart';
import 'package:user_repository/user_repository.dart';

part 'setup_event.dart';
part 'setup_state.dart';

class SetupBloc extends Bloc<SetupEvent, SetupState> {
  SetupBloc({
    required UserRepository userRepository,
    required MeasurementRepository measurementRepository,
  })  : _userRepository = userRepository,
        _measurementRepository = measurementRepository,
        super(const SetupState()) {
    on<SetupGenderChange>(_onGenderChange);
    on<SetupAgeChange>(_onAgeChange);
    on<SetupHeightChange>(_onHeightChange);
    on<SetupLengthUnitChange>(_onLengthUnitChange);
    on<SetupWeightChange>(_onWeightChange);
    on<SetupWeightUnitChange>(_onWeightUnitChange);
    on<SetupFinish>(_onFinish);
  }

  final UserRepository _userRepository;
  final MeasurementRepository _measurementRepository;

  void _onGenderChange(
    SetupGenderChange event,
    Emitter<SetupState> emit,
  ) {
    final user = state.user.copyWith(gender: event.gender);
    emit(state.copyWith(user: user));
  }

  void _onAgeChange(
    SetupAgeChange event,
    Emitter<SetupState> emit,
  ) {
    final user = state.user.copyWith(age: event.age);
    emit(state.copyWith(user: user));
  }

  void _onHeightChange(
    SetupHeightChange event,
    Emitter<SetupState> emit,
  ) {
    final user = state.user.copyWith(height: event.height);
    emit(state.copyWith(user: user));
  }

  void _onLengthUnitChange(
    SetupLengthUnitChange event,
    Emitter<SetupState> emit,
  ) {
    final double height;

    switch (event.lengthUnit) {
      case LengthUnit.centimeter:
        height = UnitConverter.inchesToCentimeters(length: state.user.height)
            .toPrecision(1);
        break;
      case LengthUnit.inch:
        height = UnitConverter.centimetersToInches(length: state.user.height)
            .toPrecision(1);
        break;
    }

    final user = state.user.copyWith(
      lengthUnit: event.lengthUnit,
      height: height,
    );
    emit(state.copyWith(user: user));
  }

  void _onWeightChange(
    SetupWeightChange event,
    Emitter<SetupState> emit,
  ) {
    final user = state.user.copyWith(weight: event.weight);
    emit(state.copyWith(user: user));
  }

  void _onWeightUnitChange(
    SetupWeightUnitChange event,
    Emitter<SetupState> emit,
  ) {
    final double weight;

    switch (event.weightUnit) {
      case WeightUnit.kilogram:
        weight = UnitConverter.poundsToKilograms(weight: state.user.weight)
            .toPrecision(1);
        break;
      case WeightUnit.pounds:
        weight = UnitConverter.kilogramsToPounds(weight: state.user.weight)
            .toPrecision(1);
        break;
    }

    final user = state.user.copyWith(
      weightUnit: event.weightUnit,
      weight: weight,
    );
    emit(state.copyWith(user: user));
  }

  Future<void> _onFinish(
    SetupFinish event,
    Emitter<SetupState> emit,
  ) async {
    emit(state.copyWith(status: SetupStatus.updating));

    var user = state.user;

    if (user.lengthUnit == LengthUnit.inch) {
      final height =
          UnitConverter.inchesToCentimeters(length: state.user.height)
              .toPrecision(1);
      user = user.copyWith(height: height);
    }

    if (user.weightUnit == WeightUnit.pounds) {
      final weight = UnitConverter.poundsToKilograms(weight: state.user.weight)
          .toPrecision(1);
      user = user.copyWith(weight: weight);
    }

    Measurement measurement;

    try {
      measurement = _measurementRepository.get(dateTime: DateTime.now());
    } on MeasurementNotFoundException catch (_) {
      measurement = Measurement(date: DateTime.now().toDay());
    }

    await _userRepository.saveUser(user);
    await _measurementRepository
        .saveMeasurement(measurement.copyWith(weight: () => user.weight));

    emit(state.copyWith(status: SetupStatus.finish));
  }
}
