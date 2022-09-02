import 'models.dart';

class WorkoutDetails {
  WorkoutDetails({
    required this.id,
    required this.workoutExercises,
  });

  final String id;
  final List<WorkoutExercise> workoutExercises;

  WorkoutDetails copyWith({
    String? id,
    List<WorkoutExercise>? workoutExercises,
  }) {
    return WorkoutDetails(
      id: id ?? this.id,
      workoutExercises: workoutExercises ?? this.workoutExercises,
    );
  }
}
