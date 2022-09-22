import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';
import 'package:workout_api/workout_api.dart' hide JsonMap;
import 'package:workout_log_api/workout_log_api.dart';

part 'workout_exercise_log.g.dart';

/// {@template workout_exercise_log}
/// A signle workoutExerciseLog item.
///
/// Contains a [id], [index], [exercise] and [exerciseSeriesLogs].
///
/// [WorkoutExerciseLog]s are immutable and can be copied using [copyWith],
/// in addition to being serialized and deserialized using [toJson]
/// and [WorkoutExerciseLog.fromJson] respectively.
/// {@endtemplate}
@immutable
@JsonSerializable()
class WorkoutExerciseLog extends Equatable {
  /// {@macro workout_exercise_log}
  WorkoutExerciseLog({
    String? id,
    required this.index,
    required this.exercise,
    required this.exerciseSeriesLogs,
    this.isFinished = false,
  })  : assert(
          id == null || id.isNotEmpty,
          '"id" can not be null and should be empty.',
        ),
        id = id ?? const Uuid().v4();

  /// The unique indentifier of the workout.
  ///
  /// Cannot be empty.
  final String id;

  /// The order in which the `exercise` is performed.
  ///
  /// If two or more [Exercise]s have the same index,
  /// they are performed in a superset.
  final int index;

  /// Current exercise
  final Exercise exercise;

  /// List of series perdormed a given `exercise`.
  final List<ExerciseSeriesLog> exerciseSeriesLogs;

  /// Flag whether the series has been executed.
  ///
  /// Defaults `false`.
  final bool isFinished;

  @override
  List<Object?> get props =>
      [id, index, exercise, exerciseSeriesLogs, isFinished];

  /// Returns a copy of this [WorkoutExerciseLog] with the given values updated.
  ///
  /// {@macro workout_exercise_log}
  WorkoutExerciseLog copyWith({
    String? id,
    int? index,
    Exercise? exercise,
    List<ExerciseSeriesLog>? exerciseSeriesLogs,
    bool? isFinished,
  }) {
    return WorkoutExerciseLog(
      id: id ?? this.id,
      index: index ?? this.index,
      exercise: exercise ?? this.exercise,
      exerciseSeriesLogs: exerciseSeriesLogs ?? this.exerciseSeriesLogs,
      isFinished: isFinished ?? this.isFinished,
    );
  }

  /// Deserializes the given [JsonMap] into a [WorkoutExerciseLog].
  factory WorkoutExerciseLog.fromJson(JsonMap json) =>
      _$WorkoutExerciseLogFromJson(json);

  /// Converts this [WorkoutExerciseLog] into a [JsonMap].
  JsonMap toJson() => _$WorkoutExerciseLogToJson(this);

  /// Convert the given [WorkoutExercise] into a [WorkoutExerciseLog]
  factory WorkoutExerciseLog.fromWorkoutExercise(
    WorkoutExercise workoutExercise,
  ) =>
      WorkoutExerciseLog(
        index: workoutExercise.index,
        exercise: workoutExercise.exercise,
        exerciseSeriesLogs: workoutExercise.exerciseSeries
            .map(ExerciseSeriesLog.fromExerciseSeries)
            .toList(),
      );
}
