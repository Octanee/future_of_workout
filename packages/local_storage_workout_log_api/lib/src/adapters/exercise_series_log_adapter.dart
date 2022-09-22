import 'package:hive_flutter/hive_flutter.dart';
import 'package:workout_log_api/workout_log_api.dart';

/// Custom [TypeAdapter] for writing and reading [ExerciseSeriesLog]
/// from local database.
class ExerciseSeriesLogAdapter extends TypeAdapter<ExerciseSeriesLog> {
  @override
  final int typeId = 13;

  @override
  ExerciseSeriesLog read(BinaryReader reader) {
    final numOfFields = reader.readByte();

    final fields = <int, dynamic>{};

    for (var i = 0; i < numOfFields; i++) {
      final field = {reader.readByte(): reader.read()};
      fields.addAll(field);
    }

    return ExerciseSeriesLog(
      id: fields[1] as String,
      index: fields[2] as int,
      weight: fields[3] as double,
      reps: fields[4] as int,
      rest: fields[5] as int,
      isFinished: fields[6] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, ExerciseSeriesLog obj) {
    writer
      ..writeByte(6)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.index)
      ..writeByte(3)
      ..write(obj.weight)
      ..writeByte(4)
      ..write(obj.reps)
      ..writeByte(5)
      ..write(obj.rest)
      ..writeByte(6)
      ..write(obj.isFinished);
  }
}
