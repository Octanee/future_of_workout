import 'package:body_api/body_api.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';
import 'package:workout_api/workout_api.dart' hide JsonMap;
import 'package:workout_log_api/workout_log_api.dart';

part 'workout_log.g.dart';

/// {@template workout_log}
/// A single workoutLog item.
///
/// Contains a [startDate], [endDate], [workoutId] and [workoutExerciseLogs].
///
/// [WorkoutLog]s are immutable and can be copied using [copyWith],
/// in addition to being serialized and deserialized using [toJson]
/// and [WorkoutLog.fromJson] respectively.
///
/// {@endtemplate}
@immutable
@JsonSerializable()
class WorkoutLog extends Equatable {
  /// {@macro workout_log}
  WorkoutLog({
    String? id,
    DateTime? startDate,
    this.endDate,
    this.workoutId,
    this.workoutExerciseLogs = const [],
    this.name = 'Workout',
  })  : assert(
          id == null || id.isNotEmpty,
          '"id" can not be null and should be empty',
        ),
        assert(
          name.isNotEmpty,
          '"id" can not be null and should be empty',
        ),
        startDate = startDate ?? DateTime.now(),
        id = id ?? const Uuid().v4();

  /// The unique indentifier of the workout.
  ///
  /// Cannot be empty.
  final String id;

  /// The date of start during workout.
  ///
  /// Defaults to `DateTime.now()`.
  final DateTime startDate;

  /// The date of end durign workout.
  final DateTime? endDate;

  /// The name of workout.
  ///
  /// Defaults `Workout`.
  final String name;

  /// The unique indentifier of during workout.
  ///
  /// Cannot be empty.
  final String? workoutId;

  /// List of [WorkoutExerciseLog] in workout.
  ///
  /// Defaults to empty list.
  final List<WorkoutExerciseLog> workoutExerciseLogs;

  /// Return a body with muscle involcement in this workout
  Body body() {
    final muscles = <Muscle, Map<double, Map<double, int>>>{};

    for (final muscle in Muscle.values) {
      final exercisesWithMuscle = workoutExerciseLogs.where(
        (exerciseLog) => exerciseLog.exercise.muscles.containsKey(muscle),
      );

      muscles.putIfAbsent(muscle, () => {});

      for (final exerciseLog in exercisesWithMuscle) {
        final muscleInvolvement = exerciseLog.exercise.muscles[muscle]!;

        muscles[muscle]!.putIfAbsent(muscleInvolvement.value, () => {});

        final finishedSeries = exerciseLog.exerciseSeriesLogs
            .where((seriesLog) => seriesLog.isFinished);

        for (final seriesLog in finishedSeries) {
          final seriesIntensity = seriesLog.intensity;

          muscles[muscle]![muscleInvolvement.value]
              ?.putIfAbsent(seriesIntensity.value, () => 0);

          final count = muscles[muscle]![muscleInvolvement.value]![
              seriesIntensity.value]!;

          muscles[muscle]![muscleInvolvement.value]!
              .update(seriesIntensity.value, (value) => count + 1);
        }
      }
    }

    return Body.fromData(data: muscles);
  }

  /// Deserializes the given [JsonMap] into a [WorkoutLog].
  factory WorkoutLog.fromJson(JsonMap json) => _$WorkoutLogFromJson(json);

  /// Converts this [WorkoutLog] into a [JsonMap].
  JsonMap toJson() => _$WorkoutLogToJson(this);

  @override
  List<Object?> get props =>
      [id, startDate, endDate, workoutId, workoutExerciseLogs];

  /// Return a copy of this [WorkoutLog] with the given values updated.
  ///
  /// {@macro workout_log}
  WorkoutLog copyWith({
    String? id,
    DateTime? startDate,
    DateTime? endDate,
    String? workoutId,
    List<WorkoutExerciseLog>? workoutExerciseLogs,
    String? name,
  }) {
    return WorkoutLog(
      id: id ?? this.id,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      workoutId: workoutId ?? this.workoutId,
      workoutExerciseLogs: workoutExerciseLogs ?? this.workoutExerciseLogs,
      name: name ?? this.name,
    );
  }

  /// Convert the given [Workout] into a [WorkoutLog]
  factory WorkoutLog.fromWorkout(Workout workout) => WorkoutLog(
        workoutId: workout.id,
        name: workout.name,
        workoutExerciseLogs: workout.workoutExercises
            .map(WorkoutExerciseLog.fromWorkoutExercise)
            .toList(),
      );
}
