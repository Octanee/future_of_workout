import 'package:equatable/equatable.dart';

import 'package:future_of_workout/src/data/models/exercise.dart';
import 'package:future_of_workout/src/data/models/exercise_series.dart';

class WorkoutExercise extends Equatable {
  const WorkoutExercise({
    required this.exercise,
    this.seriesOfExercise = const [
      ExerciseSeries(index: 1),
      ExerciseSeries(index: 2),
      ExerciseSeries(index: 3),
    ],
  });

  final Exercise exercise;

  final List<ExerciseSeries> seriesOfExercise;

  WorkoutExercise copyWith({
    Exercise? exercise,
    List<ExerciseSeries>? seriesOfExercise,
  }) {
    return WorkoutExercise(
      exercise: exercise ?? this.exercise,
      seriesOfExercise: seriesOfExercise ?? this.seriesOfExercise,
    );
  }

  @override
  List<Object?> get props => [exercise, seriesOfExercise];
}
