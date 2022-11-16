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

  factory Plan.fromJson(JsonMap json) => _$PlanFromJson(json);

  JsonMap toJson() => _$PlanToJson(this);

  Plan copyWith() {
    return Plan();
  }
}
