import 'package:goal_api/goal_api.dart';
import 'package:hive_flutter/hive_flutter.dart';

/// Custom [TypeAdapter] for writing and reading [Goal] from database.
class GoalAdapter extends TypeAdapter<Goal> {
  @override
  int get typeId => 40;

  @override
  Goal read(BinaryReader reader) {
    final numOfFields = reader.readByte();

    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };

    return Goal(
      id: fields[1] as String,
      exercise: fields[2] as Exercise,
      goal: fields[3] as double,
    );
  }

  @override
  void write(BinaryWriter writer, Goal obj) {
    writer
      ..writeByte(3)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.exercise)
      ..writeByte(3)
      ..write(obj.goal);
  }
}
