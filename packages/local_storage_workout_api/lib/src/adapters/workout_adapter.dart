import 'package:hive_flutter/adapters.dart';
import 'package:workout_api/workout_api.dart';

/// Custom [TypeAdapter] for writing and reading [Workout] from local database.
class WorkoutAdapter extends TypeAdapter<Workout> {
  @override
  final int typeId = 4;

  @override
  Workout read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Workout(
      id: fields[1] as String?,
      name: fields[2] as String,
      workoutExercises: (fields[3] as List).cast<WorkoutExercise>(),
      isFavorite: fields[4] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Workout obj) {
    writer
      ..writeByte(4)
      ..writeByte(1)
      ..writeString(obj.id)
      ..writeByte(2)
      ..writeString(obj.name)
      ..writeByte(3)
      ..writeList(obj.workoutExercises)
      ..writeByte(4)
      ..writeBool(obj.isFavorite);
  }
}
