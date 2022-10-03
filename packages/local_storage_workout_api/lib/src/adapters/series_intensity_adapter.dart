import 'package:hive_flutter/hive_flutter.dart';
import 'package:workout_api/workout_api.dart';

/// Custom [TypeAdapter] for writing and reading [SeriesIntensity]
/// from database.
class SeriesIntensityAdapter extends TypeAdapter<SeriesIntensity> {
  @override
  final int typeId = 11;

  @override
  SeriesIntensity read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 1:
        return SeriesIntensity.veryLight;
      case 2:
        return SeriesIntensity.light;
      case 3:
        return SeriesIntensity.moderate;
      case 4:
        return SeriesIntensity.vigorous;
      case 5:
        return SeriesIntensity.maximum;
      case 6:
        return SeriesIntensity.tooMuch;
      default:
        return SeriesIntensity.moderate;
    }
  }

  @override
  void write(BinaryWriter writer, SeriesIntensity obj) {
    switch (obj) {
      case SeriesIntensity.veryLight:
        writer.writeByte(1);
        break;
      case SeriesIntensity.light:
        writer.writeByte(2);
        break;
      case SeriesIntensity.moderate:
        writer.writeByte(3);
        break;
      case SeriesIntensity.vigorous:
        writer.writeByte(4);
        break;
      case SeriesIntensity.maximum:
        writer.writeByte(5);
        break;
      case SeriesIntensity.tooMuch:
        writer.writeByte(6);
        break;
    }
  }
}
