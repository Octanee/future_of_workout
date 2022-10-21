import 'package:hive_flutter/adapters.dart';
import 'package:user_api/user_api.dart';

/// Custom [TypeAdapter] for writing and reading [WeightUnit] from database.
class WeightUnitAdapter extends TypeAdapter<WeightUnit> {
  @override
  int get typeId => 62;

  @override
  WeightUnit read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 1:
        return WeightUnit.pounds;
      case 2:
      default:
        return WeightUnit.kilogram;
    }
  }

  @override
  void write(BinaryWriter writer, WeightUnit obj) {
    switch (obj) {
      case WeightUnit.pounds:
        writer.writeByte(1);
        break;
      case WeightUnit.kilogram:
        writer.writeByte(2);
        break;
    }
  }
}
