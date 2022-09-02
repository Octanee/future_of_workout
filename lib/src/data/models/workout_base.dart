import 'body.dart';
import 'workout_exercise.dart';

class WorkoutBase {
  WorkoutBase({
    required this.id,
    required this.name,
    required this.body,
    this.isFavorite = false,
  });

  final String id;
  final String name;

  final bool isFavorite;

  final Body body;

  WorkoutBase copyWith({
    String? id,
    String? name,
    bool? isFavorite,
    List<WorkoutExercise>? workoutExercises,
    Body? body,
  }) {
    return WorkoutBase(
      id: id ?? this.id,
      name: name ?? this.name,
      isFavorite: isFavorite ?? this.isFavorite,
      body: body ?? this.body,
    );
  }
}
