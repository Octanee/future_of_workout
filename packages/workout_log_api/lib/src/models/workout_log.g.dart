// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkoutLog _$WorkoutLogFromJson(Map<String, dynamic> json) => WorkoutLog(
      id: json['id'] as String?,
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
      workoutId: json['workoutId'] as String?,
      workoutExerciseLogs: (json['workoutExerciseLogs'] as List<dynamic>?)
              ?.map(
                  (e) => WorkoutExerciseLog.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      name: json['name'] as String? ?? 'Workout',
    );

Map<String, dynamic> _$WorkoutLogToJson(WorkoutLog instance) =>
    <String, dynamic>{
      'id': instance.id,
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
      'name': instance.name,
      'workoutId': instance.workoutId,
      'workoutExerciseLogs': instance.workoutExerciseLogs,
    };
