import 'body.dart';
import 'workout_exercise.dart';

class Workout {
  final String id;
  final String name;

  final List<WorkoutExercise> workoutExercises = [];
  final Body body = Body();

  Workout({
    required this.id,
    required this.name,
  });

  void addWorkoutExercise({required WorkoutExercise workoutExercise}) {
    workoutExercises.add(workoutExercise);

    // TODO Recalculate body fatigue
  }
}
