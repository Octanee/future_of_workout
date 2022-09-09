import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';
import 'package:workout_api/workout_api.dart';

part 'workout.g.dart';

/// {@template workout}
/// A single item of workout.
///
/// Contains a [id], [name] and [workoutExercises],
/// in addition to a [isFavorite] flag.
///
/// [Workout]s are immutable and can be copied using [copyWith],
/// in addition to being serialized and deserialized using [toJson]
/// and [Workout.fromJson] respectively.
/// {@endtemplate}
@immutable
@JsonSerializable()
class Workout extends Equatable {
  /// {@macro workout}
  Workout({
    String? id,
    this.name = 'Workout',
    this.workoutExercises = const [],
    this.isFavorite = false,
  })  : assert(
          id == null || id.isNotEmpty,
          '"id" can not be null and should be empty.',
        ),
        assert(name.isNotEmpty, '"name" can not be empty.'),
        id = id ?? const Uuid().v4();

  /// The unique indentifier of the workout.
  ///
  /// Cannot be empty.
  final String id;

  /// The name of the workout
  ///
  /// Cannot be empty.
  /// Defaults to "Workout"
  final String name;

  /// List list of `workoutExercises` in workout.
  ///
  /// Defaults to empty list.
  final List<WorkoutExercise> workoutExercises;

  /// Whether the workout is favorite.
  ///
  /// Defaults to `false`.
  final bool isFavorite;

  @override
  List<Object?> get props => [id, name, workoutExercises, isFavorite];

  /// Deserializes the given [JsonMap] into a [Workout].
  factory Workout.fromJson(JsonMap json) => _$WorkoutFromJson(json);

  /// Converts this [Workout] into a [JsonMap].
  JsonMap toJson() => _$WorkoutToJson(this);

  /// Returns a copy of this [Workout] with the given values updated.
  ///
  /// {@macro workout}
  Workout copyWith({
    String? id,
    String? name,
    List<WorkoutExercise>? workoutExercises,
    bool? isFavorite,
  }) {
    return Workout(
      id: id ?? this.id,
      name: name ?? this.name,
      workoutExercises: workoutExercises ?? this.workoutExercises,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
