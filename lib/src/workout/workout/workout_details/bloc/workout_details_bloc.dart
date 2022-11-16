import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:future_of_workout/src/shared/extensions.dart';
import 'package:workout_repository/workout_repository.dart';

part 'workout_details_event.dart';
part 'workout_details_state.dart';

class WorkoutDetailsBloc
    extends Bloc<WorkoutDetailsEvent, WorkoutDetailsState> {
  WorkoutDetailsBloc({
    required WorkoutRepository workoutRepository,
  })  : _workoutRepository = workoutRepository,
        super(const WorkoutDetailsState()) {
    on<WorkoutDetailsWorkoutSubscriptionRequested>(
      _onWorkoutSubscriptionRequested,
    );
    on<WorkoutDetailsRenameWorkout>(_onRenameWorkout);
    on<WorkoutDetailsDelete>(_onDelete);
    on<WorkoutDetailsAddExercises>(_onAddExercises);
    on<WorkoutDetailsReorder>(_onReorder);
  }

  final WorkoutRepository _workoutRepository;

  Future<void> _onWorkoutSubscriptionRequested(
    WorkoutDetailsWorkoutSubscriptionRequested event,
    Emitter<WorkoutDetailsState> emit,
  ) async {
    emit(state.copyWith(status: WorkoutDetailsStatus.loading));

    await emit.forEach<Plan>(
      _workoutRepository.getPlanStream(id: event.planId),
      onData: (plan) {
        final workout =
            plan.workouts.firstWhere((element) => element.id == event.id);

        return state.copyWith(
          status: WorkoutDetailsStatus.loaded,
          plan: plan,
          workout: workout,
        );
      },
      onError: (_, __) => state.copyWith(status: WorkoutDetailsStatus.failure),
    );
  }

  Future<void> _onRenameWorkout(
    WorkoutDetailsRenameWorkout event,
    Emitter<WorkoutDetailsState> emit,
  ) async {
    final name = event.name.withDefault('Workout');
    await _updateWorkout(
      workout: state.workout!.copyWith(name: name),
      emit: emit,
    );
  }

  Future<void> _onDelete(
    WorkoutDetailsDelete event,
    Emitter<WorkoutDetailsState> emit,
  ) async {
    try {
      final plan = state.plan!;
      final workouts = List.of(plan.workouts)..remove(state.workout);

      await _workoutRepository.savePlan(plan.copyWith(workouts: workouts));
      emit(state.copyWith(status: WorkoutDetailsStatus.delete));
    } catch (e) {
      emit(state.copyWith(status: WorkoutDetailsStatus.failure));
    }
  }

  Future<void> _onAddExercises(
    WorkoutDetailsAddExercises event,
    Emitter<WorkoutDetailsState> emit,
  ) async {
    final workoutExercises = List.of(state.workout!.workoutExercises);

    for (final exercise in event.exercises) {
      final item = WorkoutExercise(
        index: workoutExercises.length,
        exercise: exercise,
      );
      workoutExercises.add(item);
    }

    final workout = state.workout!.copyWith(workoutExercises: workoutExercises);

    await _updateWorkout(workout: workout, emit: emit);
  }

  Future<void> _updateWorkout({
    required Workout workout,
    required Emitter<WorkoutDetailsState> emit,
  }) async {
    try {
      emit(state.copyWith(status: WorkoutDetailsStatus.updating));
      final plan = state.plan!;

      final workouts = List.of(plan.workouts);
      final index = workouts.indexWhere((element) => element.id == workout.id);

      workouts[index] = workout;

      await _workoutRepository.savePlan(plan.copyWith(workouts: workouts));
      emit(
        state.copyWith(
          status: WorkoutDetailsStatus.updated,
          workout: workout,
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: WorkoutDetailsStatus.failure));
    }
  }

  Future<void> _onReorder(
    WorkoutDetailsReorder event,
    Emitter<WorkoutDetailsState> emit,
  ) async {
    final list = List.of(state.workout!.workoutExercises);
    final exercise = list.removeAt(event.oldIndex);

    final index =
        event.newIndex > event.oldIndex ? event.newIndex - 1 : event.newIndex;

    list.insert(index, exercise);

    final workout = state.workout!.copyWith(workoutExercises: list);

    await _updateWorkout(workout: workout, emit: emit);
  }
}
