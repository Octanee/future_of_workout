import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';
import 'package:workout_api/workout_api.dart';

part 'plan.g.dart';

/// {@template plan}
/// A single item of plan.
///
/// [Plan]s are immutable and can be copied using [copyWith],
/// in addition to being serialized and deserialized using [toJson]
/// and [Workout.fromJson] respectively.
/// {@endtemplate}
@immutable
@JsonSerializable()
class Plan extends Equatable {
  /// {@macro plan}
  Plan({
    String? id,
    this.name = 'Plan',
    this.workouts = const [],
  })  : assert(
          id == null || id.isNotEmpty,
          '"id" can not be null and should be not empty',
        ),
        assert(name.isNotEmpty, '"name" can not be empty'),
        id = id ?? const Uuid().v4();

  /// The unique indentifier of the plan.
  ///
  /// Cannot be empty.
  final String id;

  /// The name of the plan
  ///
  /// Cannot be empty.
  /// Defaults to "Plan"
  final String name;

  /// List list of [Workout]s in plan.
  ///
  /// Defaults to empty list.
  final List<Workout> workouts;

  @override
  List<Object?> get props => [id, name, workouts];

  /// Deserializes the givem `json` into a [Plan]
  factory Plan.fromJson(JsonMap json) => _$PlanFromJson(json);

  /// Converts this [Workout] into a [JsonMap]
  JsonMap toJson() => _$PlanToJson(this);

  /// Returns a copy of this [Plan]
  /// with the given values updated.
  ///
  /// {@macro plan}
  Plan copyWith({
    String? id,
    String? name,
    List<Workout>? workouts,
  }) {
    return Plan(
      id: id ?? this.id,
      name: name ?? this.name,
      workouts: workouts ?? this.workouts,
    );
  }
}
