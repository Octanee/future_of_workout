import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:future_of_workout/src/shared/shared.dart';
import 'package:measurement_repository/measurement_repository.dart';

part 'body_circuit_details_event.dart';
part 'body_circuit_details_state.dart';

class BodyCircuitDetailsBloc
    extends Bloc<BodyCircuitDetailsEvent, BodyCircuitDetailsState> {
  BodyCircuitDetailsBloc({required MeasurementRepository measurementRepository})
      : _repository = measurementRepository,
        super(const BodyCircuitDetailsState()) {
    on<BodyCircuitDetailsLoading>(_onLoading);
    on<BodyCircuitDetailsPeriodChange>(_onPeriodChange);
  }

  final MeasurementRepository _repository;

  Future<void> _onLoading(
    BodyCircuitDetailsLoading event,
    Emitter<BodyCircuitDetailsState> emit,
  ) async {
    emit(state.copyWith(status: BodyCircuitDetailsStatus.loading));

    logger.i('_onLoading : ${event.name}');

    final place =
        MeasurementPlace.values.firstWhere((place) => place.name == event.name);

    await emit.forEach<List<Measurement>>(
      _repository.getMeasurements(),
      onData: (data) {
        final list = data
            .where(
              (element) => element.circuit(place: place) != null,
            )
            .sorted((a, b) => b.date.compareTo(a.date));

        return state.copyWith(
          status: BodyCircuitDetailsStatus.success,
          measurementPlace: place,
          measurements: list,
        );
      },
      onError: (_, __) =>
          state.copyWith(status: BodyCircuitDetailsStatus.failure),
    );
  }

  void _onPeriodChange(
    BodyCircuitDetailsPeriodChange event,
    Emitter<BodyCircuitDetailsState> emit,
  ) {
    emit(state.copyWith(period: event.period));
  }
}
