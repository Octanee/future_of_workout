// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Exercise _$ExerciseFromJson(Map<String, dynamic> json) => Exercise(
      id: json['id'] as String?,
      name: json['name'] as String,
      muscles: (json['muscles'] as Map<String, dynamic>).map(
        (k, e) => MapEntry($enumDecode(_$MuscleEnumMap, k),
            $enumDecode(_$MuscleInvolvementEnumMap, e)),
      ),
      imagePath: json['imagePath'] as String? ?? 'assets/exercises/default.svg',
      imagePathSecondary: json['imagePathSecondary'] as String? ??
          'assets/exercises/default.svg',
      equipment: (json['equipment'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$EquipmentEnumMap, e))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$ExerciseToJson(Exercise instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imagePath': instance.imagePath,
      'imagePathSecondary': instance.imagePathSecondary,
      'muscles': instance.muscles.map((k, e) =>
          MapEntry(_$MuscleEnumMap[k]!, _$MuscleInvolvementEnumMap[e]!)),
      'equipment':
          instance.equipment.map((e) => _$EquipmentEnumMap[e]!).toList(),
    };

const _$MuscleInvolvementEnumMap = {
  MuscleInvolvement.primary: 'primary',
  MuscleInvolvement.secondary: 'secondary',
  MuscleInvolvement.additional: 'additional',
  MuscleInvolvement.another: 'another',
};

const _$MuscleEnumMap = {
  Muscle.neck: 'neck',
  Muscle.chest: 'chest',
  Muscle.serratus: 'serratus',
  Muscle.frontShoulders: 'frontShoulders',
  Muscle.midShoulders: 'midShoulders',
  Muscle.backShoulders: 'backShoulders',
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

const _$EquipmentEnumMap = {
  Equipment.barbell: 'barbell',
  Equipment.dumbell: 'dumbell',
  Equipment.machine: 'machine',
  Equipment.cable: 'cable',
};
