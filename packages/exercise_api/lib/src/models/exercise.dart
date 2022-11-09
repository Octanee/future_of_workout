import 'package:equatable/equatable.dart';
import 'package:exercise_api/exercise_api.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';

part 'exercise.g.dart';

/// {@template exercise}
/// A single exercise item.
///
/// Contains a [id], [name], [imagePath] and [imagePathSecondary],
/// in addtion to a list [muscles] and [].
///
/// If a [id] is provided, it cannot be empty. If no [id] is provided,
/// one will be generated.
///
/// [name], [imagePath] and [imagePathSecondary] cannot be empty.
///
/// [Exercise] are immutable and can be copied using [copyWith],
///
/// {@endtemplate}
@immutable
@JsonSerializable()
class Exercise extends Equatable {
  /// {@macro exercise}
  Exercise({
    String? id,
    required this.name,
    required this.muscles,
    this.imagePath = 'assets/exercises/default.svg',
    this.imagePathSecondary = 'assets/exercises/default.svg',
    this.equipment = const [],
  })  : assert(
          id == null || id.isNotEmpty,
          '"id" can not be null and should be empty.',
        ),
        assert(name.isNotEmpty, '"name" of the Exercise can not be empty'),
        assert(imagePath.isNotEmpty, '"imagePath" to image can not be empty'),
        assert(
          imagePathSecondary.isNotEmpty,
          '"imagePathSecondary" to image can not be empty',
        ),
        id = id ?? const Uuid().v4();

  /// The unique identifier of the exercise.
  ///
  /// Cannot be empty.
  final String id;

  /// The name of the exercise.
  ///
  /// Cannot be empty.
  final String name;

  /// The path to first image of exercise.
  ///
  /// Cannot be empty.
  final String imagePath;

  /// The path to secondary image of exercise.
  ///
  /// Cannot be empty.
  final String imagePathSecondary;

  /// Map of muscle with involvement.
  final Map<Muscle, MuscleInvolvement> muscles;

  /// Equipment required to exercise
  final List<Equipment> equipment;

  @override
  List<Object?> get props => [
        id,
        name,
        muscles,
        imagePath,
        imagePathSecondary,
        equipment,
      ];

  /// Return a copy of this [Exercise] with the given values updated.
  ///
  /// {@macro exercise}
  Exercise copyWith({
    String? id,
    String? name,
    String? imagePath,
    String? imagePathSecondary,
    Map<Muscle, MuscleInvolvement>? muscles,
    List<Equipment>? equipment,
  }) {
    return Exercise(
      id: id ?? this.id,
      name: name ?? this.name,
      muscles: muscles ?? this.muscles,
      imagePath: imagePath ?? this.imagePath,
      imagePathSecondary: imagePathSecondary ?? this.imagePathSecondary,
      equipment: equipment ?? this.equipment,
    );
  }

  /// Deserializes the given [JsonMap] into a [Exercise].
  factory Exercise.fromJson(JsonMap json) => _$ExerciseFromJson(json);

  /// Converts this [Exercise] into a [JsonMap].
  JsonMap toJson() => _$ExerciseToJson(this);
}
