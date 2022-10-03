import 'package:exercise_api/exercise_api.dart';
import 'package:hive_flutter/hive_flutter.dart';

/// Custom [TypeAdapter] for writing and reading [Muscle] from database.
class MuscleAdapter extends TypeAdapter<Muscle> {
  @override
  final int typeId = 2;

  @override
  Muscle read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 1:
        return Muscle.neck;
      case 2:
        return Muscle.chest;
      case 3:
        return Muscle.serratus;
      case 4:
        return Muscle.shoulders;
      case 5:
        return Muscle.biceps;
      case 6:
        return Muscle.triceps;
      case 7:
        return Muscle.forearm;
      case 8:
        return Muscle.abs;
      case 9:
        return Muscle.obliques;
      case 10:
        return Muscle.trapezius;
      case 11:
        return Muscle.lattisimus;
      case 12:
        return Muscle.teresMajor;
      case 13:
        return Muscle.erectorSpinae;
      case 14:
        return Muscle.adductors;
      case 15:
        return Muscle.abductors;
      case 16:
        return Muscle.glutes;
      case 17:
        return Muscle.quadriceps;
      case 18:
        return Muscle.hamstering;
      case 19:
        return Muscle.calf;
      default:
        return Muscle.neck;
    }
  }

  @override
  void write(BinaryWriter writer, Muscle obj) {
    switch (obj) {
      case Muscle.neck:
        writer.writeByte(1);
        break;
      case Muscle.chest:
        writer.writeByte(2);
        break;
      case Muscle.serratus:
        writer.writeByte(3);
        break;
      case Muscle.shoulders:
        writer.writeByte(4);
        break;
      case Muscle.biceps:
        writer.writeByte(5);
        break;
      case Muscle.triceps:
        writer.writeByte(6);
        break;
      case Muscle.forearm:
        writer.writeByte(7);
        break;
      case Muscle.abs:
        writer.writeByte(8);
        break;
      case Muscle.obliques:
        writer.writeByte(9);
        break;
      case Muscle.trapezius:
        writer.writeByte(10);
        break;
      case Muscle.lattisimus:
        writer.writeByte(11);
        break;
      case Muscle.teresMajor:
        writer.writeByte(12);
        break;
      case Muscle.erectorSpinae:
        writer.writeByte(13);
        break;
      case Muscle.adductors:
        writer.writeByte(14);
        break;
      case Muscle.abductors:
        writer.writeByte(15);
        break;
      case Muscle.glutes:
        writer.writeByte(16);
        break;
      case Muscle.quadriceps:
        writer.writeByte(17);
        break;
      case Muscle.hamstering:
        writer.writeByte(18);
        break;
      case Muscle.calf:
        writer.writeByte(19);
        break;
    }
  }
}
