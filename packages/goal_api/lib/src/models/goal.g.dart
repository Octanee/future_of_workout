// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Goal _$GoalFromJson(Map<String, dynamic> json) => Goal(
      id: json['id'] as String?,
      exercise: Exercise.fromJson(json['exercise'] as Map<String, dynamic>),
      goal: (json['goal'] as num).toDouble(),
    );

Map<String, dynamic> _$GoalToJson(Goal instance) => <String, dynamic>{
      'id': instance.id,
      'exercise': instance.exercise,
      'goal': instance.goal,
    };
