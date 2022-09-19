// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_series.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExerciseSeries _$ExerciseSeriesFromJson(Map<String, dynamic> json) =>
    ExerciseSeries(
      index: json['index'] as int,
      weight: (json['weight'] as num?)?.toDouble() ?? 0,
      reps: json['reps'] as int? ?? 12,
      rest: json['rest'] as int? ?? 120,
    );

Map<String, dynamic> _$ExerciseSeriesToJson(ExerciseSeries instance) =>
    <String, dynamic>{
      'index': instance.index,
      'weight': instance.weight,
      'reps': instance.reps,
      'rest': instance.rest,
    };
