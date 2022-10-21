import 'package:hive_flutter/adapters.dart';
import 'package:user_api/user_api.dart';

/// Custom [TypeAdapter] for writing and reading [User] from database.
class UserAdapter extends TypeAdapter<User> {
  @override
  int get typeId => 63;

  @override
  User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };

    return User(
      height: fields[1] as double,
      weight: fields[2] as double,
      age: fields[3] as int,
      gender: fields[4] as Gender,
      lengthUnit: fields[5] as LengthUnit,
      weightUnit: fields[6] as WeightUnit,
    );
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(6)
      ..writeByte(1)
      ..write(obj.height)
      ..writeByte(2)
      ..write(obj.weight)
      ..writeByte(3)
      ..write(obj.age)
      ..writeByte(4)
      ..write(obj.gender)
      ..writeByte(5)
      ..write(obj.lengthUnit)
      ..writeByte(6)
      ..write(obj.weight);
  }
}
