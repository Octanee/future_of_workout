// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_series_log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExerciseSeriesLog _$ExerciseSeriesLogFromJson(Map<String, dynamic> json) =>
    ExerciseSeriesLog(
      id: json['id'] as String?,
      weight: (json['weight'] as num?)?.toDouble() ?? 0,
      reps: json['reps'] as int? ?? 12,
      rest: json['rest'] as int? ?? 120,
    );

Map<String, dynamic> _$ExerciseSeriesLogToJson(ExerciseSeriesLog instance) =>
    <String, dynamic>{
      'id': instance.id,
      'weight': instance.weight,
      'reps': instance.reps,
      'rest': instance.rest,
    };
