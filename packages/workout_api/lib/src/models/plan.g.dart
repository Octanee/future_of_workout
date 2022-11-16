// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Plan _$PlanFromJson(Map<String, dynamic> json) => Plan(
      id: json['id'] as String?,
      name: json['name'] as String? ?? 'Plan',
      workouts: (json['workouts'] as List<dynamic>?)
              ?.map((e) => Workout.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$PlanToJson(Plan instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'workouts': instance.workouts,
    };
