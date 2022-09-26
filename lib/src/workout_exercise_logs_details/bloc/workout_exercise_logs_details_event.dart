part of 'workout_exercise_logs_details_bloc.dart';

abstract class WorkoutExerciseLogsDetailsEvent extends Equatable {
  const WorkoutExerciseLogsDetailsEvent();

  @override
  List<Object> get props => [];
}

class WorkoutExerciseLogsDetailsSubscriptionRequest
    extends WorkoutExerciseLogsDetailsEvent {
  const WorkoutExerciseLogsDetailsSubscriptionRequest({
    required this.workoutLogId,
    required this.workoutExerciseLogId,
  });

  final String workoutLogId;
  final String workoutExerciseLogId;

  @override
  List<Object> get props => [workoutExerciseLogId, workoutLogId];
}

class WorkoutExerciseLogsDetailsPop extends WorkoutExerciseLogsDetailsEvent {
  const WorkoutExerciseLogsDetailsPop();
}

class WorkoutExerciseLogsDetailsUpdateSeries
    extends WorkoutExerciseLogsDetailsEvent {
  const WorkoutExerciseLogsDetailsUpdateSeries({required this.seriesLog});

  final ExerciseSeriesLog seriesLog;

  @override
  List<Object> get props => [seriesLog];
}
