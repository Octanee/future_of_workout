import 'package:exercise_api/exercise_api.dart';
import 'package:hive_flutter/hive_flutter.dart';

/// Custom [TypeAdapter] for writing and reading [Exercise] from database.
class ExerciseAdapter extends TypeAdapter<Exercise> {
  @override
  int get typeId => 0;

  @override
  Exercise read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };

    final json = {
      'id': fields[0],
      'name': fields[1],
      'primaryMuscle': fields[2],
      'imagePath': fields[3],
      'imagePathSecondary': fields[4],
    };

    return Exercise.fromJson(json);
  }

  @override
  void write(BinaryWriter writer, Exercise obj) {
    final json = obj.toJson();
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..writeString(json['id'] as String)
      ..writeByte(1)
      ..writeString(json['name'] as String)
      ..writeByte(2)
      ..writeString(json['primaryMuscle'] as String)
      ..writeByte(3)
      ..writeString(json['imagePath'] as String)
      ..writeByte(4)
      ..writeString(json['imagePathSecondary'] as String);
  }
}
