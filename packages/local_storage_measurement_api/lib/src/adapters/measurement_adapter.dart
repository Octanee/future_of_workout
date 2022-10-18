import 'package:hive_flutter/hive_flutter.dart';
import 'package:local_storage_measurement_api/local_storage_measurement_api.dart';

/// Custom [TypeAdapter] for writing and reading
/// [Measurement] from local database.
class MeasurementAdapter extends TypeAdapter<Measurement> {
  @override
  final int typeId = 50;

  @override
  Measurement read(BinaryReader reader) {
    final numOfFields = reader.readByte();

    final fields = <int, dynamic>{};

    for (var i = 0; i < numOfFields; i++) {
      final field = {reader.readByte(): reader.read()};
      fields.addAll(field);
    }

    return Measurement(
      date: fields[1] as DateTime,
      weight: fields[2] as double?,
      neckCircuit: fields[3] as double?,
      chestCircuit: fields[4] as double?,
      bicepsCircuit: fields[5] as double?,
      waistCircuit: fields[6] as double?,
      bellyCircuit: fields[7] as double?,
      hipCircuit: fields[8] as double?,
      calfCircuit: fields[9] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, Measurement obj) {
    writer
      ..writeByte(9)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.weight)
      ..writeByte(3)
      ..write(obj.circuit(place: MeasurementPlace.neck))
      ..writeByte(4)
      ..write(obj.circuit(place: MeasurementPlace.chest))
      ..writeByte(5)
      ..write(obj.circuit(place: MeasurementPlace.biceps))
      ..writeByte(6)
      ..write(obj.circuit(place: MeasurementPlace.waist))
      ..writeByte(7)
      ..write(obj.circuit(place: MeasurementPlace.belly))
      ..writeByte(8)
      ..write(obj.circuit(place: MeasurementPlace.hip))
      ..writeByte(9)
      ..write(obj.circuit(place: MeasurementPlace.calf));
  }
}
