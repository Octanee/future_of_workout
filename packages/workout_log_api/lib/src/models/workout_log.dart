import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:workout_log_api/workout_log_api.dart';

part 'workout_log.g.dart';

/// {@template workout_log}
/// A single workoutLog item.
///
/// Contains a [startDate], [endDate], [workoutId] and [workoutExerciseLogs].
///
///
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
    DateTime? startDate,
    this.endDate,
    required this.workoutId,
    this.workoutExerciseLogs = const [],
  })  : startDate = startDate ?? DateTime.now(),
        assert(workoutId.isNotEmpty, '"workoutId" can not be empty.');

  final DateTime startDate;

  final DateTime? endDate;

  final String workoutId;

  final List<WorkoutExerciseLog> workoutExerciseLogs;

  /// Deserializes the given [JsonMap] into a [WorkoutLog].
  factory WorkoutLog.fromJson(JsonMap json) => _$WorkoutLogFromJson(json);

  /// Converts this [WorkoutLog] into a [JsonMap].
  JsonMap toJson() => _$WorkoutLogToJson(this);

  @override
  List<Object?> get props =>
      [startDate, endDate, workoutId, workoutExerciseLogs];

  WorkoutLog copyWith({
    DateTime? startDate,
    DateTime? endDate,
    String? workoutId,
    List<WorkoutExerciseLog>? workoutExerciseLogs,
  }) {
    return WorkoutLog(
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      workoutId: workoutId ?? this.workoutId,
      workoutExerciseLogs: workoutExerciseLogs ?? this.workoutExerciseLogs,
    );
  }
}