part of 'workout_logs_details_bloc.dart';

abstract class WorkoutLogsDetailsEvent extends Equatable {
  const WorkoutLogsDetailsEvent();

  @override
  List<Object> get props => [];
}

class WorkoutLogsDetailsSubscriptionRequest extends WorkoutLogsDetailsEvent {
  const WorkoutLogsDetailsSubscriptionRequest({required this.id});

  final String id;

  @override
  List<Object> get props => [id];
}

class WorkoutLogsDetailsDelete extends WorkoutLogsDetailsEvent {
  const WorkoutLogsDetailsDelete();
}

class WorkoutLogsDetailsAddExercises extends WorkoutLogsDetailsEvent {
  const WorkoutLogsDetailsAddExercises({required this.exercises});

  final List<Exercise> exercises;

  @override
  List<Object> get props => [exercises];
}
