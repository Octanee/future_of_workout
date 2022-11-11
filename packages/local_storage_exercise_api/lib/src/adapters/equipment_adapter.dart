import 'package:exercise_api/exercise_api.dart';
import 'package:hive_flutter/hive_flutter.dart';

/// Custom [TypeAdapter] for writing and reading [Equipment]
/// from database.
class EquipmentAdapter extends TypeAdapter<Equipment> {
  @override
  final int typeId = 4;

  @override
  Equipment read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 1:
        return Equipment.barbell;
      case 2:
        return Equipment.dumbell;
      case 3:
        return Equipment.machine;
      case 4:
        return Equipment.machine;
    }
    return Equipment.barbell;
  }

  @override
  void write(BinaryWriter writer, Equipment obj) {
    switch (obj) {
      case Equipment.barbell:
        writer.writeByte(1);
        break;
      case Equipment.dumbell:
        writer.writeByte(2);
        break;
      case Equipment.machine:
        writer.writeByte(3);
        break;
      case Equipment.cable:
        writer.writeByte(3);
        break;
    }
  }
}
