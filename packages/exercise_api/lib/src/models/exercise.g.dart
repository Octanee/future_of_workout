// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Exercise _$ExerciseFromJson(Map<String, dynamic> json) => Exercise(
      id: json['id'] as String?,
      name: json['name'] as String,
      primaryMuscle: $enumDecode(_$MuscleEnumMap, json['primaryMuscle']),
      imagePath: json['imagePath'] as String? ?? 'assets/exercises/default.svg',
      imagePathSecondary: json['imagePathSecondary'] as String? ??
          'assets/exercises/default.svg',
    );

Map<String, dynamic> _$ExerciseToJson(Exercise instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imagePath': instance.imagePath,
      'imagePathSecondary': instance.imagePathSecondary,
      'primaryMuscle': _$MuscleEnumMap[instance.primaryMuscle],
    };

const _$MuscleEnumMap = {
  Muscle.neck: 'neck',
  Muscle.chest: 'chest',
  Muscle.serratus: 'serratus',
  Muscle.shoulders: 'shoulders',
  Muscle.biceps: 'biceps',
  Muscle.triceps: 'triceps',
  Muscle.forearm: 'forearm',
  Muscle.abs: 'abs',
  Muscle.obliques: 'obliques',
  Muscle.trapezius: 'trapezius',
  Muscle.lattisimus: 'lattisimus',
  Muscle.teresMajor: 'teresMajor',
  Muscle.erectorSpinae: 'erectorSpinae',
  Muscle.adductors: 'adductors',
  Muscle.abductors: 'abductors',
  Muscle.glutes: 'glutes',
  Muscle.quadriceps: 'quadriceps',
  Muscle.hamstering: 'hamstering',
  Muscle.calf: 'calf',
};
