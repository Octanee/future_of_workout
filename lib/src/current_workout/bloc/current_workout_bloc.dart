import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:workout_api/workout_api.dart';
import 'package:workout_repository/workout_repository.dart';

part 'current_workout_event.dart';
part 'current_workout_state.dart';

class CurrentWorkoutBloc
    extends Bloc<CurrentWorkoutEvent, CurrentWorkoutState> {
  CurrentWorkoutBloc({required WorkoutRepository workoutRepository})
      : _workoutRepository = workoutRepository,
        super(const CurrentWorkoutState()) {
    on<CurrentWorkoutLoadingWorkout>(_onLoadingWorkout);
    on<CurrentWorkoutWorkoutExerciseFinished>(_onWorkoutExerciseFinished);
    on<CurrentWorkoutFinishWorkout>(_onFinishWorkout);
  }

  final WorkoutRepository _workoutRepository;

  void _onLoadingWorkout(
    CurrentWorkoutLoadingWorkout event,
    Emitter<CurrentWorkoutState> emit,
  ) {
    try {
      final workout = _workoutRepository.get(id: event.id);
      final workoutExercisesMap = Map<WorkoutExercise, bool>.fromIterable(
        workout.workoutExercises,
        value: (e) => false,
      );

      emit(
        state.copyWith(
          status: CurrentWorkoutStatus.loaded,
          workout: workout,
          workoutExercises: workoutExercisesMap,
        ),
      );
    } on WorkoutNotFoundException catch (_) {
      emit(state.copyWith(status: CurrentWorkoutStatus.failure));
    }
  }

  void _onWorkoutExerciseFinished(
    CurrentWorkoutWorkoutExerciseFinished event,
    Emitter<CurrentWorkoutState> emit,
  ) {
    emit(state.copyWith(status: CurrentWorkoutStatus.updating));

    final newMap = state.workoutExercises
      ..update(event.workoutExercise, (value) => true);

    emit(
      state.copyWith(
        status: CurrentWorkoutStatus.updated,
        workoutExercises: newMap,
      ),
    );
  }

  void _onFinishWorkout(
    CurrentWorkoutFinishWorkout event,
    Emitter<CurrentWorkoutState> emit,
  ) {
    emit(state.copyWith(status: CurrentWorkoutStatus.finish));
  }
}
