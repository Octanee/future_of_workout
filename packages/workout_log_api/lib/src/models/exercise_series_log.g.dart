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
      intensity: $enumDecode(_$SeriesIntensityEnumMap, json['intensity']),
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
      'intensity': _$SeriesIntensityEnumMap[instance.intensity]!,
    };

const _$SeriesIntensityEnumMap = {
  SeriesIntensity.veryLight: 'veryLight',
  SeriesIntensity.light: 'light',
  SeriesIntensity.moderate: 'moderate',
  SeriesIntensity.vigorous: 'vigorous',
  SeriesIntensity.maximum: 'maximum',
  SeriesIntensity.tooMuch: 'tooMuch',
};
