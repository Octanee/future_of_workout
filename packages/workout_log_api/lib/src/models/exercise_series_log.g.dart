// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_series_log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExerciseSeriesLog _$ExerciseSeriesLogFromJson(Map<String, dynamic> json) =>
    ExerciseSeriesLog(
      id: json['id'] as String?,
      weight: (json['weight'] as num).toDouble(),
      reps: json['reps'] as int,
      rest: json['rest'] as int,
    );

Map<String, dynamic> _$ExerciseSeriesLogToJson(ExerciseSeriesLog instance) =>
    <String, dynamic>{
      'id': instance.id,
      'weight': instance.weight,
      'reps': instance.reps,
      'rest': instance.rest,
    };
