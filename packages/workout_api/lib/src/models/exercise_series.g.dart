// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_series.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExerciseSeries _$ExerciseSeriesFromJson(Map<String, dynamic> json) =>
    ExerciseSeries(
      id: json['id'] as String?,
      index: json['index'] as int,
      weight: (json['weight'] as num?)?.toDouble() ?? 20,
      reps: json['reps'] as int? ?? 12,
      rest: json['rest'] as int? ?? 120,
      intensity:
          $enumDecodeNullable(_$SeriesIntensityEnumMap, json['intensity']) ??
              SeriesIntensity.moderate,
    );

Map<String, dynamic> _$ExerciseSeriesToJson(ExerciseSeries instance) =>
    <String, dynamic>{
      'id': instance.id,
      'index': instance.index,
      'weight': instance.weight,
      'reps': instance.reps,
      'rest': instance.rest,
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
