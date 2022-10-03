import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';
import 'package:workout_api/workout_api.dart' hide JsonMap;
import 'package:workout_log_api/workout_log_api.dart';

part 'exercise_series_log.g.dart';

/// {@template exercise_series_log}
/// A single exerciseSeriesLog item.
///
/// Contains a [id], [index], [weight], [reps], [rest] time
/// and [isFinished] flag.
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
    required this.index,
    required this.weight,
    required this.reps,
    required this.rest,
    required this.intensity,
    this.isFinished = false,
  })  : assert(
          id == null || id.isNotEmpty,
          '"id" can not be null and should be empty',
        ),
        id = id ?? const Uuid().v4();

  /// The unique indentifier of the workout.
  ///
  /// Cannot be empty.
  final String id;

  /// Index of series in exercise.
  final int index;

  /// The value of weight in that log of series.
  final double weight;

  /// The value of reps performed in a series.
  final int reps;

  /// The time of rest after series.
  final int rest;

  /// Flag whether the series has been executed.
  ///
  /// Defaults `false`.
  final bool isFinished;

  /// Intensity of series;
  final SeriesIntensity intensity;

  /// Returns a copy of this [ExerciseSeriesLog] with the given values updated.
  ///
  /// {@macro exercise_series_log}
  ExerciseSeriesLog copyWith({
    String? id,
    int? index,
    double? weight,
    int? reps,
    int? rest,
    SeriesIntensity? intensity,
    bool? isFinished,
  }) {
    return ExerciseSeriesLog(
      id: id ?? this.id,
      index: index ?? this.index,
      weight: weight ?? this.weight,
      reps: reps ?? this.reps,
      rest: rest ?? this.rest,
      intensity: intensity ?? this.intensity,
      isFinished: isFinished ?? this.isFinished,
    );
  }

  /// Deserializes the given [JsonMap] into a [ExerciseSeriesLog].
  factory ExerciseSeriesLog.fromJson(JsonMap json) =>
      _$ExerciseSeriesLogFromJson(json);

  /// Converts this [ExerciseSeriesLog] into a [JsonMap].
  JsonMap toJson() => _$ExerciseSeriesLogToJson(this);

  @override
  List<Object?> get props =>
      [id, index, weight, reps, rest, intensity, isFinished];

  /// Convert the given [ExerciseSeries] into a [ExerciseSeriesLog]
  factory ExerciseSeriesLog.fromExerciseSeries(ExerciseSeries series) =>
      ExerciseSeriesLog(
        index: series.index,
        weight: series.weight,
        reps: series.reps,
        rest: series.rest,
        intensity: series.intensity,
      );
}
