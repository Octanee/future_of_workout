// ignore_for_file: lines_longer_than_80_chars

import 'package:equatable/equatable.dart';

import 'models.dart';

class Workout extends Equatable {
  const Workout({
    required this.id,
    required this.name,
    required this.body,
    this.isFavorite = false,
    this.workoutExercises = const [],
  });

  final String id;

  final String name;
  final bool isFavorite;
  final Body body;

  final List<WorkoutExercise> workoutExercises;

  Workout copyWith({
    String? name,
    bool? isFavorite,
    Body? body,
    List<WorkoutExercise>? workoutExercises,
  }) {
    return Workout(
      id: id,
      name: name ?? this.name,
      isFavorite: isFavorite ?? this.isFavorite,
      body: body ?? this.body,
      workoutExercises: workoutExercises ?? this.workoutExercises,
    );
  }

  @override
  List<Object?> get props => [id, name, isFavorite, body];

  @override
  String toString() {
    return 'Workout(id: $id, name: $name, isFavorite: $isFavorite, workoutExercises: ${workoutExercises.length})';
  }
}
