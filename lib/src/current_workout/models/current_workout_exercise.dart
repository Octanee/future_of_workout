import 'package:equatable/equatable.dart';
import 'package:exercise_api/exercise_api.dart';

import 'package:future_of_workout/src/current_workout/current_workout.dart';

class CurrentWorkoutExercise extends Equatable {
  const CurrentWorkoutExercise({
    required this.id,
    required this.index,
    required this.exercise,
    required this.series,
    this.isFinished = false,
  });

  final String id;
  final int index;
  final Exercise exercise;
  final List<CurrentWorkoutSeries> series;
  final bool isFinished;

  @override
  List<Object> get props => [id, index, exercise, series, isFinished];

  CurrentWorkoutExercise copyWith({
    String? id,
    int? index,
    Exercise? exercise,
    List<CurrentWorkoutSeries>? series,
    bool? isFinished,
  }) {
    return CurrentWorkoutExercise(
      id: id ?? this.id,
      index: index ?? this.index,
      exercise: exercise ?? this.exercise,
      series: series ?? this.series,
      isFinished: isFinished ?? this.isFinished,
    );
  }
}
