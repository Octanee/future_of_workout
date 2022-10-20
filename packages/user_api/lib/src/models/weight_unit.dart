/// {@tempalte weight_unit}
/// Type of displayed unit weight.
/// {@endtemplate}
enum WeightUnit {
  /// Kilogram
  kilogram(name: 'Kilogram', sufix: 'kg'),

  /// Inch
  pounds(name: 'Pounds', sufix: 'lb');

  /// {@macro weight_unit}
  const WeightUnit({
    required this.name,
    required this.sufix,
  });

  /// Displayed name of unit.
  final String name;

  /// Text displated after value.
  final String sufix;
}
