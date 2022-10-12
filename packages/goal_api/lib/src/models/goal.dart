import 'package:equatable/equatable.dart';
import 'package:goal_api/goal_api.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';

part 'goal.g.dart';

/// {@template record}
/// A single item of exercise record.
///
/// Contains a [id], [exercise] and [goal],
///
/// [Goal]s are immutable and can be copied using [copyWith],
/// in addition to being serialized and deserialized using [toJson]
/// and [Goal.fromJson] respectively.
/// {@endtemplate}
@immutable
@JsonSerializable()
class Goal extends Equatable {
  /// {@macro record}
  Goal({
    String? id,
    required this.exercise,
    required this.goal,
  })  : assert(
          id == null || id.isNotEmpty,
          '"id" can not be null and should be empty.',
        ),
        id = id ?? const Uuid().v4();

  /// The unique indentifier of the record.
  ///
  /// Cannot be empty.
  final String id;

  /// Exercise for a given record.
  final Exercise exercise;

  /// Value of record.
  final double goal;

  @override
  List<Object?> get props => [id, exercise, goal];

  /// Deserializes the given [JsonMap] into a [Goal].
  factory Goal.fromJson(JsonMap json) => _$GoalFromJson(json);

  /// Converts this [Goal] into a [JsonMap].
  JsonMap toJson() => _$GoalToJson(this);

  /// Returns a copy of this [Goal] with the given values updated.
  ///
  /// {@macro record}
  Goal copyWith({
    String? id,
    Exercise? exercise,
    double? goal,
  }) {
    return Goal(
      id: id ?? this.id,
      exercise: exercise ?? this.exercise,
      goal: goal ?? this.goal,
    );
  }
}
