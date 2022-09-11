import 'package:hive_flutter/hive_flutter.dart';
import 'package:workout_api/workout_api.dart';

/// Custom [TypeAdapter] for writing and reading [WorkoutExercise]
/// from local database.
class WorkoutExerciseAdapter extends TypeAdapter<WorkoutExercise> {
  @override
  final int typeId = 3;

  @override
  WorkoutExercise read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WorkoutExercise(
      id: fields[1] as String,
      index: fields[2] as int,
      exercise: fields[3] as Exercise,
      exerciseSeries: (fields[4] as List).cast<ExerciseSeries>(),
    );
  }

  @override
  void write(BinaryWriter writer, WorkoutExercise obj) {
    writer
      ..writeByte(4)
      ..writeByte(1)
      ..writeString(obj.id)
      ..writeByte(2)
      ..writeInt(obj.index)
      ..writeByte(3)
      ..write(obj.exercise)
      ..writeByte(4)
      ..writeList(obj.exerciseSeries);
  }
}
