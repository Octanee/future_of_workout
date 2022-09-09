import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:workout_api/workout_api.dart';

part 'exercise_series.g.dart';

/// {@template exercise_series}
/// A single exerciseSeries item.
///
/// Contains a [weight], [reps] and [rest] time.
///
///
/// [ExerciseSeries]s are immutable and can be copied using [copyWith],
/// in addition to being serialized and deserialized using [toJson]
/// and [ExerciseSeries.fromJson] respectively.
/// {@endtemplate}
@immutable
@JsonSerializable()
class ExerciseSeries extends Equatable {
  /// {@macro exercise_series}
  const ExerciseSeries({
    this.weight = 0,
    this.reps = 12,
    this.rest = 120,
  });

  /// The value of weight in that series.
  ///
  /// Defaults to `0`.
  final double weight;

  /// The value of reps to do in series.
  ///
  /// Defaults to `12`.
  final int reps;

  /// The time of rest after series.
  ///
  /// Defaults to `120`.
  final int rest;

  /// Returns a copy of this [ExerciseSeries] with the given values updated.
  ///
  /// {@macro exercise_series}
  ExerciseSeries copyWith({
    int? index,
    double? weight,
    int? reps,
    int? rest,
  }) {
    return ExerciseSeries(
      weight: weight ?? this.weight,
      reps: reps ?? this.reps,
      rest: rest ?? this.rest,
    );
  }

  /// Deserializes the given [JsonMap] into a [ExerciseSeries].
  factory ExerciseSeries.fromJson(JsonMap json) =>
      _$ExerciseSeriesFromJson(json);

  /// Converts this [ExerciseSeries] into a [JsonMap].
  JsonMap toJson() => _$ExerciseSeriesToJson(this);

  @override
  List<Object?> get props => [weight, reps, rest];
}
