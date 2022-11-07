/// {@tempalte weight_unit}
/// Type of displayed unit weight.
/// {@endtemplate}
enum WeightUnit {
  /// Kilogram
  kilogram(sufix: 'kg'),

  /// Inch
  pounds(sufix: 'lb');

  /// {@macro weight_unit}
  const WeightUnit({
    required this.sufix,
  });

  /// Text displated after value.
  final String sufix;
}
