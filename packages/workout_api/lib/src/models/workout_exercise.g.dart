// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_exercise.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkoutExercise _$WorkoutExerciseFromJson(Map<String, dynamic> json) =>
    WorkoutExercise(
      index: json['index'] as int,
      exercise: Exercise.fromJson(json['exercise'] as Map<String, dynamic>),
      exerciseSeries: (json['exerciseSeries'] as List<dynamic>?)
              ?.map((e) => ExerciseSeries.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [ExerciseSeries(), ExerciseSeries(), ExerciseSeries()],
    );

Map<String, dynamic> _$WorkoutExerciseToJson(WorkoutExercise instance) =>
    <String, dynamic>{
      'index': instance.index,
      'exercise': instance.exercise,
      'exerciseSeries': instance.exerciseSeries,
    };
