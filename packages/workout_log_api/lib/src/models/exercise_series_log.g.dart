// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_series_log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExerciseSeriesLog _$ExerciseSeriesLogFromJson(Map<String, dynamic> json) =>
    ExerciseSeriesLog(
      id: json['id'] as String?,
      index: json['index'] as int,
      weight: (json['weight'] as num).toDouble(),
      reps: json['reps'] as int,
      rest: json['rest'] as int,
      isFinished: json['isFinished'] as bool? ?? false,
    );

Map<String, dynamic> _$ExerciseSeriesLogToJson(ExerciseSeriesLog instance) =>
    <String, dynamic>{
      'id': instance.id,
      'index': instance.index,
      'weight': instance.weight,
      'reps': instance.reps,
      'rest': instance.rest,
      'isFinished': instance.isFinished,
    };
