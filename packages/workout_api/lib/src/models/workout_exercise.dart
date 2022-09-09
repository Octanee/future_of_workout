import 'package:equatable/equatable.dart';
import 'package:exercise_repository/exercise_repository.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';
import 'package:workout_api/workout_api.dart';

part 'workout_exercise.g.dart';

/// {@template workout_exercise}
/// A signle workoutExercise item.
///
/// Contains a [id], [index], [exercise] and [exerciseSeries].
///
/// If a [id] is provided, it cannot be empty.
/// If no [id] is provided, one will be generated.
///
/// [WorkoutExercise]s are immutable and can be copied using [copyWith],
/// in addition to being serialized and deserialized using [toJson]
/// and [WorkoutExercise.fromJson] respectively.
/// {@endtemplate}
@immutable
@JsonSerializable()
class WorkoutExercise extends Equatable {
  /// {@macro workout_exercise}
  WorkoutExercise({
    //String? id,
    required this.index,
    required this.exercise,
    this.exerciseSeries = const [
      ExerciseSeries(),
      ExerciseSeries(),
      ExerciseSeries(),
    ],
  }) ;
  //  : assert(
  //         id == null || id.isNotEmpty,
  //         '"id" can not be null and should be empty.',
  //       ),
  //       id = id ?? const Uuid().v4();

  // /// The unique identifier of the workoutExercise.
  // ///
  // /// Cannot be empty.
  // final String id;

  /// The order in which the `exercise` is performed.
  ///
  /// If two or more [Exercise]s have the same index,
  /// they are performed in a superset.
  final int index;

  /// Current exercise
  final Exercise exercise;

  /// List of series to be perdormed during a given `exercise`.
  ///
  /// Defaults includes `3` series.
  final List<ExerciseSeries> exerciseSeries;

  @override
  List<Object?> get props => [index, exercise, exerciseSeries];

  /// Returns a copy of this [WorkoutExercise] with the given values updated.
  ///
  /// {@macro workout_exercise}
  WorkoutExercise copyWith({
    //String? id,
    int? index,
    Exercise? exercise,
    List<ExerciseSeries>? exerciseSeries,
  }) {
    return WorkoutExercise(
      //id: id ?? this.id,
      index: index ?? this.index,
      exercise: exercise ?? this.exercise,
      exerciseSeries: exerciseSeries ?? this.exerciseSeries,
    );
  }

  /// Deserializes the given [JsonMap] into a [WorkoutExercise].
  factory WorkoutExercise.fromJson(JsonMap json) =>
      _$WorkoutExerciseFromJson(json);

  /// Converts this [WorkoutExercise] into a [JsonMap].
  JsonMap toJson() => _$WorkoutExerciseToJson(this);
}
