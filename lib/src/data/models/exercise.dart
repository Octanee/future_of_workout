import 'package:future_of_workout/src/data/models/models.dart';

class Exercise {
  const Exercise({
    required this.id,
    required this.name,
    required this.primaryMuscle,
    required this.body,
    this.imagePathStart = 'assets/exercises/default.svg',
    this.imagePathEnd = 'assets/exercises/default.svg',
    this.equipment = const [],
    this.instructions = const [],
    this.secondaryMuscles = const [],
  });

  final String id;

  final String name;
  final String imagePathStart;
  final String imagePathEnd;
  final Muscle primaryMuscle;
  final Body body;

  final List<Equipment> equipment;
  final List<String> instructions;
  final List<Muscle> secondaryMuscles;

  Exercise copyWith({
    String? id,
    String? name,
    String? imagePathStart,
    String? imagePathEnd,
    Muscle? primaryMuscle,
    Body? body,
    List<Equipment>? equipment,
    List<String>? instructions,
    List<Muscle>? secondaryMuscles,
  }) {
    return Exercise(
      id: id ?? this.id,
      name: name ?? this.name,
      imagePathStart: imagePathStart ?? this.imagePathStart,
      imagePathEnd: imagePathEnd ?? this.imagePathEnd,
      primaryMuscle: primaryMuscle ?? this.primaryMuscle,
      body: body ?? this.body,
      equipment: equipment ?? this.equipment,
      instructions: instructions ?? this.instructions,
      secondaryMuscles: secondaryMuscles ?? this.secondaryMuscles,
    );
  }
}
