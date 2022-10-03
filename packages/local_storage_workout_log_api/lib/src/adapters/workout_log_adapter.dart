import 'package:hive_flutter/hive_flutter.dart';
import 'package:workout_log_api/workout_log_api.dart';

/// Custom [TypeAdapter] for writing and reading
/// [WorkoutLog] from local database.
class WorkoutLogAdapter extends TypeAdapter<WorkoutLog> {
  @override
  final int typeId = 24;

  @override
  WorkoutLog read(BinaryReader reader) {
    final numOfFields = reader.readByte();

    final fields = <int, dynamic>{};

    for (var i = 0; i < numOfFields; i++) {
      final field = {reader.readByte(): reader.read()};
      fields.addAll(field);
    }

    return WorkoutLog(
      id: fields[1] as String?,
      startDate: fields[2] as DateTime,
      endDate: fields[3] as DateTime?,
      workoutId: fields[4] as String?,
      workoutExerciseLogs: (fields[5] as List).cast<WorkoutExerciseLog>(),
    );
  }

  @override
  void write(BinaryWriter writer, WorkoutLog obj) {
    writer
      ..writeByte(5)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.startDate)
      ..writeByte(3)
      ..write(obj.endDate)
      ..writeByte(4)
      ..write(obj.workoutId)
      ..writeByte(5)
      ..write(obj.workoutExerciseLogs);
  }
}
