part of 'exercise_details_bloc.dart';

abstract class ExerciseDetailsEvent extends Equatable {
  const ExerciseDetailsEvent();

  @override
  List<Object> get props => [];
}

class ExerciseDetailsLoadingRequested extends ExerciseDetailsEvent {
  const ExerciseDetailsLoadingRequested({
    required this.id,
  });

  final String id;

  @override
  List<Object> get props => [id];
}
