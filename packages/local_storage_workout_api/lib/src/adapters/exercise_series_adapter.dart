import 'package:hive_flutter/hive_flutter.dart';
import 'package:workout_api/workout_api.dart';

/// Custom [TypeAdapter] for writing and reading [ExerciseSeries]
/// from local database.
class ExerciseSeriesAdapter extends TypeAdapter<ExerciseSeries> {
  @override
  final int typeId = 2;

  @override
  ExerciseSeries read(BinaryReader reader) {
    final numOfFields = reader.readByte();

    final fields = <int, dynamic>{};

    for (var i = 0; i < numOfFields; i++) {
      final field = {reader.readByte(): reader.read()};
      fields.addAll(field);
    }

    return ExerciseSeries(
      index: fields[1] as int,
      weight: fields[1] as double,
      reps: fields[2] as int,
      rest: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, ExerciseSeries obj) {
    writer
      ..writeByte(4)
      ..writeByte(1)
      ..write(obj.index)
      ..writeByte(2)
      ..write(obj.weight)
      ..writeByte(3)
      ..write(obj.reps)
      ..writeByte(4)
      ..write(obj.rest);
  }
}
