import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';
import 'package:workout_api/workout_log_api.dart';

part 'exercise_series_log.g.dart';

/// {@template exercise_series_log}
/// A single exerciseSeriesLog item.
///
/// Contains a [id]] [weight], [reps], [rest] time and performed [exercise].
///
/// If a [id] is provided, it cannot be empty.
/// If no [id] is provided one will be generated.
///
/// [ExerciseSeriesLog]s are immutable and can be copied using [copyWith],
/// in addition to being serialized and deserialized using [toJson]
/// and [ExerciseSeriesLog.fromJson] respectively.
/// {@endtemplate}
@immutable
@JsonSerializable()
class ExerciseSeriesLog extends Equatable {
  /// {@macro exercise_series_log}
  ExerciseSeriesLog({
    String? id,
    required this.weight,
    required this.reps,
    required this.rest,
    required this.exercise,
  })  : assert(
          id == null || id.isNotEmpty,
          '"id" can not be null and should be empty',
        ),
        id = id ?? const Uuid().v4();

  /// The unique indentifier of the workout.
  ///
  /// Cannot be empty.
  final String id;

  /// The value of weight in that log of series.
  final double weight;

  /// The value of reps performed in a series.
  final int reps;

  /// The time of rest after series.
  final int rest;

  /// Instance of exercise performed in that series.
  final Exercise exercise;

  /// Returns a copy of this [ExerciseSeriesLog] with the given values updated.
  ///
  /// {@macro exercise_series_log}
  ExerciseSeriesLog copyWith({
    String? id,
    double? weight,
    int? reps,
    int? rest,
    Exercise? exercise,
  }) {
    return ExerciseSeriesLog(
      id: id ?? this.id,
      weight: weight ?? this.weight,
      reps: reps ?? this.reps,
      rest: rest ?? this.rest,
      exercise: exercise ?? this.exercise,
    );
  }

  /// Deserializes the given [JsonMap] into a [ExerciseSeriesLog].
  factory ExerciseSeriesLog.fromJson(JsonMap json) =>
      _$ExerciseSeriesLogFromJson(json);

  /// Converts this [ExerciseSeriesLog] into a [JsonMap].
  JsonMap toJson() => _$ExerciseSeriesLogToJson(this);

  @override
  List<Object?> get props => [id, weight, reps, rest, exercise];
}
