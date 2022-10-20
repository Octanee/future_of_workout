/// {@tempalte length_unit}
/// Type of displayed unit length.
/// {@endtemplate}
enum LengthUnit {
  /// Centimeter
  centimeter(name: 'Centimeter', sufix: 'cm'),

  /// Inch
  inch(name: 'Inch', sufix: '"');

  /// {@macro length_unit}
  const LengthUnit({
    required this.name,
    required this.sufix,
  });

  /// Displayed name of unit.
  final String name;

  /// Text displated after value.
  final String sufix;
}
