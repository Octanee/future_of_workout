import 'package:hive_flutter/adapters.dart';
import 'package:user_api/user_api.dart';

/// Custom [TypeAdapter] for writing and reading [Gender] from database.
class GenderAdapter extends TypeAdapter<Gender> {
  @override
  int get typeId => 60;

  @override
  Gender read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 1:
        return Gender.male;
      case 2:
        return Gender.female;
      case 3:
      default:
        return Gender.other;
    }
  }

  @override
  void write(BinaryWriter writer, Gender obj) {
    switch (obj) {
      case Gender.male:
        writer.writeByte(1);
        break;
      case Gender.female:
        writer.writeByte(2);
        break;
      case Gender.other:
        writer.writeByte(3);
        break;
    }
  }
}
