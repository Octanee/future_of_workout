// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_series_log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExerciseSeriesLog _$ExerciseSeriesLogFromJson(Map<String, dynamic> json) =>
    ExerciseSeriesLog(
      weight: (json['weight'] as num?)?.toDouble() ?? 0,
      reps: json['reps'] as int? ?? 12,
      rest: json['rest'] as int? ?? 120,
    );

Map<String, dynamic> _$ExerciseSeriesLogToJson(ExerciseSeriesLog instance) =>
    <String, dynamic>{
      'weight': instance.weight,
      'reps': instance.reps,
      'rest': instance.rest,
    };
