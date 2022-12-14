import 'package:exercise_api/exercise_api.dart';
import 'package:hive_flutter/hive_flutter.dart';

/// Custom [TypeAdapter] for writing and reading [Exercise] from database.
class ExerciseAdapter extends TypeAdapter<Exercise> {
  @override
  final int typeId = 1;

  @override
  Exercise read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Exercise(
      id: fields[1] as String?,
      name: fields[2] as String,
      imagePath: fields[3] as String,
      imagePathSecondary: fields[4] as String,
      muscles: (fields[5] as Map).cast<Muscle, MuscleInvolvement>(),
      equipment: (fields[6] as List).cast<Equipment>(),
    );
  }

  @override
  void write(BinaryWriter writer, Exercise obj) {
    writer
      ..writeByte(6)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.imagePath)
      ..writeByte(4)
      ..write(obj.imagePathSecondary)
      ..writeByte(5)
      ..write(obj.muscles)
      ..writeByte(6)
      ..write(obj.equipment);
  }
}
