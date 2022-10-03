/// {@template muscle_involvement}
/// List of body muscles.
///
/// Contains a [value] property.
/// {@endtemplate}
enum MuscleInvolvement {
  /// PRIMARY
  primary(value: 1),

  /// SECONDARY
  secondary(value: 0.75),

  /// ADDITIONAL
  additional(value: 0.5);

  ///{@macro muscle_involvement}
  const MuscleInvolvement({required this.value});

  /// Value of muscle involvement.
  final double value;
}
