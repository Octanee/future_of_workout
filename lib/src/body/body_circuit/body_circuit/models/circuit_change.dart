import 'package:equatable/equatable.dart';
import 'package:local_storage_measurement_api/local_storage_measurement_api.dart';

class CircuitChange extends Equatable {
  const CircuitChange({
    required this.place,
    required this.firstValue,
    required this.lastValue,
  });

  final MeasurementPlace place;
  final double firstValue;
  final double lastValue;

  @override
  List<Object?> get props => [place, firstValue, lastValue];
}
