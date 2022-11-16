import 'package:hive_flutter/adapters.dart';
import 'package:workout_api/workout_api.dart';

/// Custom [TypeAdapter] for writing and reading [Plan] from local database.
class PlanAdapter extends TypeAdapter<Plan> {
  @override
  final int typeId = 14;

  @override
  Plan read(BinaryReader reader) {
    final numOfFields = reader.readByte();

    final fields = <int, dynamic>{};

    for (var i = 0; i < numOfFields; i++) {
      final field = {reader.readByte(): reader.read()};
      fields.addAll(field);
    }

    return Plan(
      id: fields[1] as String?,
      name: fields[2] as String,
      workouts: (fields[3] as List).cast<Workout>(),
    );
  }

  @override
  void write(BinaryWriter writer, Plan obj) {
    writer
      ..writeByte(4)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.workouts);
  }
}
