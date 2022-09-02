import 'workout_base.dart';
import 'workout_details.dart';

class Workout {
  const Workout({
    required this.id,
    required this.base,
    required this.details,
  });

  final String id;
  final WorkoutBase base;
  final WorkoutDetails details;

  Workout copyWith({
    String? id,
    WorkoutBase? base,
    WorkoutDetails? details,
  }) {
    return Workout(
      id: id ?? this.id,
      base: base ?? this.base,
      details: details ?? this.details,
    );
  }
}
