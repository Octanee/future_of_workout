import 'models.dart';

class Exercise {
  const Exercise({
    required this.id,
    required this.base,
    required this.details,
  });

  final String id;
  final ExerciseBase base;
  final ExerciseDetails details;

  Exercise copyWith({
    String? id,
    ExerciseBase? base,
    ExerciseDetails? details,
  }) {
    return Exercise(
      id: id ?? this.id,
      base: base ?? this.base,
      details: details ?? this.details,
    );
  }
}
