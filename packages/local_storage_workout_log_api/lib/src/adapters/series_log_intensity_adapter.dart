import 'package:hive_flutter/hive_flutter.dart';
import 'package:workout_log_api/workout_log_api.dart';

/// Custom [TypeAdapter] for writing and reading [SeriesLogIntensity]
/// from database.
class SeriesLogIntensityAdapter extends TypeAdapter<SeriesLogIntensity> {
  @override
  final int typeId = 22;

  @override
  SeriesLogIntensity read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 1:
        return SeriesLogIntensity.veryLight;
      case 2:
        return SeriesLogIntensity.light;
      case 3:
        return SeriesLogIntensity.moderate;
      case 4:
        return SeriesLogIntensity.vigorous;
      case 5:
        return SeriesLogIntensity.maximum;
      case 6:
        return SeriesLogIntensity.tooMuch;
      default:
        return SeriesLogIntensity.moderate;
    }
  }

  @override
  void write(BinaryWriter writer, SeriesLogIntensity obj) {
    switch (obj) {
      case SeriesLogIntensity.veryLight:
        writer.writeByte(1);
        break;
      case SeriesLogIntensity.light:
        writer.writeByte(2);
        break;
      case SeriesLogIntensity.moderate:
        writer.writeByte(3);
        break;
      case SeriesLogIntensity.vigorous:
        writer.writeByte(4);
        break;
      case SeriesLogIntensity.maximum:
        writer.writeByte(5);
        break;
      case SeriesLogIntensity.tooMuch:
        writer.writeByte(6);
        break;
    }
  }
}
