import 'models.dart';

class ExerciseBase {
  const ExerciseBase({
    required this.id,
    required this.name,
    required this.primaryMuscle,
    required this.body,
    this.imagePathStart = 'assets/exercises/default.svg',
    this.imagePathEnd = 'assets/exercises/default.svg',
  });

  final String id;

  final String name;

  final String imagePathStart;
  final String imagePathEnd;

  final Muscle primaryMuscle;

  final Body body;

  ExerciseBase copyWith({
    String? id,
    String? name,
    String? imagePathStart,
    String? imagePathEnd,
    Muscle? primaryMuscle,
    Body? body,
  }) {
    return ExerciseBase(
      id: id ?? this.id,
      name: name ?? this.name,
      imagePathStart: imagePathStart ?? this.imagePathStart,
      imagePathEnd: imagePathEnd ?? this.imagePathEnd,
      primaryMuscle: primaryMuscle ?? this.primaryMuscle,
      body: body ?? this.body,
    );
  }
}
