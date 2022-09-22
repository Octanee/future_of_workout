// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_exercise_log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkoutExerciseLog _$WorkoutExerciseLogFromJson(Map<String, dynamic> json) =>
    WorkoutExerciseLog(
      id: json['id'] as String?,
      index: json['index'] as int,
      exercise: Exercise.fromJson(json['exercise'] as Map<String, dynamic>),
      exerciseSeriesLogs: (json['exerciseSeriesLogs'] as List<dynamic>)
          .map((e) => ExerciseSeriesLog.fromJson(e as Map<String, dynamic>))
          .toList(),
      isFinished: json['isFinished'] as bool? ?? false,
    );

Map<String, dynamic> _$WorkoutExerciseLogToJson(WorkoutExerciseLog instance) =>
    <String, dynamic>{
      'id': instance.id,
      'index': instance.index,
      'exercise': instance.exercise,
      'exerciseSeriesLogs': instance.exerciseSeriesLogs,
      'isFinished': instance.isFinished,
    };
