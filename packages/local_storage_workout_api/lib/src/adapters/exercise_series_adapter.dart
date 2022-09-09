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
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ExerciseSeries(
      weight: fields[1] as double,
      reps: fields[2] as int,
      rest: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, ExerciseSeries obj) {
    writer
      ..writeByte(3)
      ..writeByte(1)
      ..write(obj.weight)
      ..writeByte(2)
      ..write(obj.reps)
      ..writeByte(3)
      ..write(obj.rest);
  }
}
