/// {@tempalte length_unit}
/// Type of displayed unit length.
/// {@endtemplate}
enum LengthUnit {
  /// Centimeter
  centimeter(sufix: 'cm'),

  /// Inch
  inch(sufix: '"');

  /// {@macro length_unit}
  const LengthUnit({
    required this.sufix,
  });

  /// Text displated after value.
  final String sufix;
}
