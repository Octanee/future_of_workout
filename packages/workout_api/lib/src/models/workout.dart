import 'package:body_api/body_api.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';
import 'package:workout_api/workout_api.dart';

part 'workout.g.dart';

/// {@template workout}
/// A single item of workout.
///
/// Contains a [id], [name] and [workoutExercises].
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

  /// Return a body with muscle involcement in this workout
  Body body() {
    final muscles = <Muscle, Map<double, Map<double, int>>>{};

    for (final muscle in Muscle.values) {
      final exercisesWithMuscle = workoutExercises.where(
        (exerciseLog) => exerciseLog.exercise.muscles.containsKey(muscle),
      );

      muscles.putIfAbsent(muscle, () => {});

      for (final exercise in exercisesWithMuscle) {
        final muscleInvolvement = exercise.exercise.muscles[muscle]!;

        muscles[muscle]!.putIfAbsent(muscleInvolvement.value, () => {});

        for (final seriesLog in exercise.exerciseSeries) {
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

  @override
  List<Object?> get props => [id, name, workoutExercises];

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
  }) {
    return Workout(
      id: id ?? this.id,
      name: name ?? this.name,
      workoutExercises: workoutExercises ?? this.workoutExercises,
    );
  }
}
