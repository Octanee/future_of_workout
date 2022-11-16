// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      age: json['age'] as int? ?? 18,
      height: (json['height'] as num?)?.toDouble() ?? 180,
      weight: (json['weight'] as num?)?.toDouble() ?? 75,
      gender:
          $enumDecodeNullable(_$GenderEnumMap, json['gender']) ?? Gender.male,
      lengthUnit:
          $enumDecodeNullable(_$LengthUnitEnumMap, json['lengthUnit']) ??
              LengthUnit.centimeter,
      weightUnit:
          $enumDecodeNullable(_$WeightUnitEnumMap, json['weightUnit']) ??
              WeightUnit.kilogram,
      currentPlanId: json['currentPlanId'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'height': instance.height,
      'weight': instance.weight,
      'age': instance.age,
      'gender': _$GenderEnumMap[instance.gender]!,
      'lengthUnit': _$LengthUnitEnumMap[instance.lengthUnit]!,
      'weightUnit': _$WeightUnitEnumMap[instance.weightUnit]!,
      'currentPlanId': instance.currentPlanId,
    };

const _$GenderEnumMap = {
  Gender.male: 'male',
  Gender.female: 'female',
  Gender.other: 'other',
};

const _$LengthUnitEnumMap = {
  LengthUnit.centimeter: 'centimeter',
  LengthUnit.inch: 'inch',
};

const _$WeightUnitEnumMap = {
  WeightUnit.kilogram: 'kilogram',
  WeightUnit.pounds: 'pounds',
};
