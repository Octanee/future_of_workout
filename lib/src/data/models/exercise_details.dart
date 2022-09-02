import 'enums/enum.dart';

class ExerciseDetails {
  const ExerciseDetails({
    required this.id,
    this.equipment = const [],
    this.instructions = const [],
    this.secondaryMuscles = const [],
  });

  final String id;
  final List<Equipment> equipment;
  final List<String> instructions;
  final List<Muscle> secondaryMuscles;

  ExerciseDetails copyWith({
    String? id,
    List<Equipment>? equipment,
    List<String>? instructions,
    List<Muscle>? secondaryMuscles,
  }) {
    return ExerciseDetails(
      id: id ?? this.id,
      equipment: equipment ?? this.equipment,
      instructions: instructions ?? this.instructions,
      secondaryMuscles: secondaryMuscles ?? this.secondaryMuscles,
    );
  }
}
