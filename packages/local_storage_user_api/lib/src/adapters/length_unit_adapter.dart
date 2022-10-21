import 'package:hive_flutter/adapters.dart';
import 'package:user_api/user_api.dart';

/// Custom [TypeAdapter] for writing and reading [LengthUnit] from database.
class LengthUnitAdapter extends TypeAdapter<LengthUnit> {
  @override
  int get typeId => 61;

  @override
  LengthUnit read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 1:
        return LengthUnit.inch;
      case 2:
      default:
        return LengthUnit.centimeter;
    }
  }

  @override
  void write(BinaryWriter writer, LengthUnit obj) {
    switch (obj) {
      case LengthUnit.inch:
        writer.writeByte(1);
        break;
      case LengthUnit.centimeter:
        writer.writeByte(2);
        break;
    }
  }
}
