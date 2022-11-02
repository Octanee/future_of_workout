import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:body_api/body_api.dart';
import 'package:equatable/equatable.dart';
import 'package:workout_log_repository/workout_log_repository.dart';

part 'body_recovery_event.dart';
part 'body_recovery_state.dart';

class BodyRecoveryBloc extends Bloc<BodyRecoveryEvent, BodyRecoveryState> {
  BodyRecoveryBloc({required WorkoutLogRepository workoutLogRepository})
      : _repository = workoutLogRepository,
        super(const BodyRecoveryState()) {
    on<BodyRecoveryLoading>(_onLoading);
    on<BodyRecoveryChangePosition>(_onChangePosition);
  }

  final WorkoutLogRepository _repository;

  Future<void> _onLoading(
    BodyRecoveryLoading event,
    Emitter<BodyRecoveryState> emit,
  ) async {
    emit(state.copyWith(status: BodyRecoveryStatus.loading));

    await emit.forEach<List<WorkoutLog>>(
      _repository.getWorkoutLogs(),
      onData: (logs) {
        const timeElapsed = 24 * 7;

        final list = logs.where(
          (log) =>
              log.endDate?.isAfter(
                DateTime.now().subtract(const Duration(hours: timeElapsed)),
              ) ??
              false,
        );

        const recoveryTime = 24 * 3;

        final body = _getBody(list, recoveryTime);

        return state.copyWith(status: BodyRecoveryStatus.success, body: body);
      },
      onError: (_, __) => state.copyWith(status: BodyRecoveryStatus.failure),
    );
  }

  Body _getBody(Iterable<WorkoutLog> list, int recoveryTime) {
    final map = {for (var log in list) log.endDate!: log.body()};

    int getInvolvement({required Muscle muscle}) {
      var muscleInvolvement = 0.0;

      map.forEach((date, body) {
        final involvement = body.involvement(muscle: muscle);
        final timeElapsed = DateTime.now().difference(date).inHours;

        final value = involvement * (1 - (timeElapsed / recoveryTime));

        muscleInvolvement += value;
      });

      return muscleInvolvement.floor();
    }

    final body = Body(
      neckInvolvement: getInvolvement(muscle: Muscle.neck),
      chestInvolvement: getInvolvement(muscle: Muscle.chest),
      serratusInvolvement: getInvolvement(muscle: Muscle.serratus),
      shouldersInvolvement: getInvolvement(muscle: Muscle.shoulders),
      bicepsInvolvement: getInvolvement(muscle: Muscle.biceps),
      tricepsInvolvement: getInvolvement(muscle: Muscle.triceps),
      forearmInvolvement: getInvolvement(muscle: Muscle.forearm),
      absInvolvement: getInvolvement(muscle: Muscle.abs),
      obliquesInvolvement: getInvolvement(muscle: Muscle.obliques),
      trapeziusInvolvement: getInvolvement(muscle: Muscle.trapezius),
      lattisimusInvolvement: getInvolvement(muscle: Muscle.lattisimus),
      teresMajorInvolvement: getInvolvement(muscle: Muscle.teresMajor),
      erectorSpinaeInvolvement: getInvolvement(muscle: Muscle.erectorSpinae),
      adductorsInvolvement: getInvolvement(muscle: Muscle.adductors),
      abductorsInvolvement: getInvolvement(muscle: Muscle.abductors),
      glutesInvolvement: getInvolvement(muscle: Muscle.glutes),
      hamsteringInvolvement: getInvolvement(muscle: Muscle.hamstering),
      quadricepsInvolvement: getInvolvement(muscle: Muscle.quadriceps),
      calfInvolvement: getInvolvement(muscle: Muscle.calf),
    );
    return body;
  }

  void _onChangePosition(
    BodyRecoveryChangePosition event,
    Emitter<BodyRecoveryState> emit,
  ) {
    emit(state.copyWith(isFront: event.isFront));
  }
}
