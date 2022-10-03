import 'package:hive_flutter/hive_flutter.dart';
import 'package:workout_log_api/workout_log_api.dart';

/// Custom [TypeAdapter] for writing and reading [WorkoutExerciseLog]
/// from local database.
class WorkoutExerciseLogAdapter extends TypeAdapter<WorkoutExerciseLog> {
  @override
  final int typeId = 23;

  @override
  WorkoutExerciseLog read(BinaryReader reader) {
    final numOfFields = reader.readByte();

    final fields = <int, dynamic>{};

    for (var i = 0; i < numOfFields; i++) {
      final field = {reader.readByte(): reader.read()};
      fields.addAll(field);
    }

    return WorkoutExerciseLog(
      id: fields[1] as String,
      index: fields[2] as int,
      exercise: fields[3] as Exercise,
      exerciseSeriesLogs: (fields[4] as List).cast<ExerciseSeriesLog>(),
      isFinished: fields[5] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, WorkoutExerciseLog obj) {
    writer
      ..writeByte(5)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.index)
      ..writeByte(3)
      ..write(obj.exercise)
      ..writeByte(4)
      ..write(obj.exerciseSeriesLogs)
      ..writeByte(5)
      ..write(obj.isFinished);
  }
}
