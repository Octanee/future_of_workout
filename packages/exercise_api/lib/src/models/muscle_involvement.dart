/// {@template muscle_involvement}
/// Types pf involvement muscle in exercise.
///
/// Contains a [value] property.
/// {@endtemplate}
enum MuscleInvolvement {
  /// PRIMARY: `1`
  primary(value: 1),

  /// SECONDARY: `0.75`
  secondary(value: 0.75),

  /// ADDITIONAL: `0.5`
  additional(value: 0.5),

  /// ANOTHE: `0.1`
  another(value: 0.1);

  ///{@macro muscle_involvement}
  const MuscleInvolvement({required this.value});

  /// Value of muscle involvement.
  final double value;
}
