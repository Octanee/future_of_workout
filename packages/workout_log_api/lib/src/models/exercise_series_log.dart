import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:workout_api/workout_log_api.dart';

part 'exercise_series_log.g.dart';

/// {@template exercise_series_log}
/// A single exerciseSeriesLog item.
///
/// Contains a [weight], [reps] and [rest] time.
///
///
/// [ExerciseSeriesLog]s are immutable and can be copied using [copyWith],
/// in addition to being serialized and deserialized using [toJson]
/// and [ExerciseSeriesLog.fromJson] respectively.
/// {@endtemplate}
@immutable
@JsonSerializable()
class ExerciseSeriesLog extends Equatable {
  /// {@macro exercise_series_log}
  const ExerciseSeriesLog({
    this.weight = 0,
    this.reps = 12,
    this.rest = 120,
  });

  /// The value of weight in that log of series.
  final double weight;

  /// The value of reps performed in a series.
  final int reps;

  /// The time of rest after series.
  final int rest;

  /// Returns a copy of this [ExerciseSeries] with the given values updated.
  ///
  /// {@macro exercise_series}
  ExerciseSeriesLog copyWith({
    int? index,
    double? weight,
    int? reps,
    int? rest,
  }) {
    return ExerciseSeriesLog(
      weight: weight ?? this.weight,
      reps: reps ?? this.reps,
      rest: rest ?? this.rest,
    );
  }

  /// Deserializes the given [JsonMap] into a [ExerciseSeriesLog].
  factory ExerciseSeriesLog.fromJson(JsonMap json) =>
      _$ExerciseSeriesLogFromJson(json);

  /// Converts this [ExerciseSeriesLog] into a [JsonMap].
  JsonMap toJson() => _$ExerciseSeriesLogToJson(this);

  @override
  List<Object?> get props => [weight, reps, rest];
}
