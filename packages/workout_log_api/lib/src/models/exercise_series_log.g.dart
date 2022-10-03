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
      intensity: $enumDecode(_$SeriesLogIntensityEnumMap, json['intensity']),
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
      'intensity': _$SeriesLogIntensityEnumMap[instance.intensity]!,
    };

const _$SeriesLogIntensityEnumMap = {
  SeriesLogIntensity.veryLight: 'veryLight',
  SeriesLogIntensity.light: 'light',
  SeriesLogIntensity.moderate: 'moderate',
  SeriesLogIntensity.vigorous: 'vigorous',
  SeriesLogIntensity.maximum: 'maximum',
  SeriesLogIntensity.tooMuch: 'tooMuch',
};
