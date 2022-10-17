/// {@template measurement_place}
/// The place where the user takes the measurement.
/// {@endtemplate}
enum MeasurementPlace {
  /// Neck
  neck(name: 'Neck'),

  /// Chest
  chest(name: 'Chest'),

  /// Biceps
  biceps(name: 'Biceps'),

  /// Waist
  waist(name: 'Waist'),

  /// Belly
  belly(name: 'Belly'),

  /// Hip
  hip(name: 'Hip'),

  /// Thigh
  thigh(name: 'Thigh'),

  /// Calf
  calf(name: 'Calf');

  /// {@macro measurement_place}
  const MeasurementPlace({required this.name});

  /// The displayed name of measurement place.
  final String name;
}
