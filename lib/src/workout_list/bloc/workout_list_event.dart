part of 'workout_list_bloc.dart';

abstract class WorkoutListEvent extends Equatable {
  const WorkoutListEvent();

  @override
  List<Object?> get props => [];
}

class WorkoutListSubcriptionRequested extends WorkoutListEvent {
  const WorkoutListSubcriptionRequested();
}

class WorkoutListWorkoutFavoriteToggled extends WorkoutListEvent {
  const WorkoutListWorkoutFavoriteToggled({
    required this.workout,
    required this.isFavorite,
  });

  final Workout workout;
  final bool isFavorite;

  @override
  List<Object?> get props => [workout, isFavorite];
}

class WorkoutListNewWorkoutAdding extends WorkoutListEvent {
  const WorkoutListNewWorkoutAdding();
}
