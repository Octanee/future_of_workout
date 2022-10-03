/// {@template series_log_intensity}
/// Types of series intensity.
///
/// Contains a [value] property.
/// {@endtemplate}
enum SeriesLogIntensity {
  /// Very light
  ///
  /// `6` or more repetition in reserved
  veryLight(value: 0.4, name: 'Very light'),

  /// Light
  ///
  /// `4-5` repetition in reserved
  light(value: 0.6, name: 'Light'),

  /// Moderate
  ///
  /// `2-3` repetition in reserved
  moderate(value: 0.75, name: 'Moderate'),

  /// Vigorous
  ///
  /// `1` repetition in reserved
  vigorous(value: 0.9, name: 'Vigorous'),

  /// Maximum
  ///
  /// `0` repetition in reserved
  maximum(value: 1, name: 'Maximum'),

  /// Too much
  ///
  /// Can not complete repetition
  tooMuch(value: 1.1, name: 'Too much');

  ///{@macro series_log_intensity}
  const SeriesLogIntensity({required this.value, required this.name});

  /// Value of series intensity.
  final double value;

  /// Name to display.
  final String name;
}
