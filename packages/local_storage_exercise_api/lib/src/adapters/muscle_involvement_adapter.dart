import 'package:exercise_api/exercise_api.dart';
import 'package:hive_flutter/hive_flutter.dart';

/// Custom [TypeAdapter] for writing and reading [MuscleInvolvement]
/// from database.
class MuscleInvolvementAdapter extends TypeAdapter<MuscleInvolvement> {
  @override
  final int typeId = 3;

  @override
  MuscleInvolvement read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 1:
        return MuscleInvolvement.primary;
      case 2:
        return MuscleInvolvement.secondary;
      case 3:
        return MuscleInvolvement.additional;
      case 4:
        return MuscleInvolvement.another;
      default:
        return MuscleInvolvement.primary;
    }
  }

  @override
  void write(BinaryWriter writer, MuscleInvolvement obj) {
    switch (obj) {
      case MuscleInvolvement.primary:
        writer.writeByte(1);
        break;
      case MuscleInvolvement.secondary:
        writer.writeByte(2);
        break;
      case MuscleInvolvement.additional:
        writer.writeByte(3);
        break;
      case MuscleInvolvement.another:
        writer.writeByte(4);
    }
  }
}
