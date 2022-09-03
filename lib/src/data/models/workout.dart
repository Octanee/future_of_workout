import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

import 'models.dart';

class Workout extends Equatable {
  Workout({
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
    String? id,
    String? name,
    bool? isFavorite,
    Body? body,
    List<WorkoutExercise>? workoutExercises,
  }) {
    return Workout(
      id: id ?? this.id,
      name: name ?? this.name,
      isFavorite: isFavorite ?? this.isFavorite,
      body: body ?? this.body,
      workoutExercises: workoutExercises ?? this.workoutExercises,
    );
  }

  @override
  List<Object?> get props => throw UnimplementedError();
}
