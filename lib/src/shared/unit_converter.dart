class UnitConverter {
  const UnitConverter._();

  static const double _kilogramsToPoundsConversionValue = 2.204622622;
  static const double _centimetersToInchesConversionValue = 0.393700787402;

  static double kilogramsToPounds({required double weight}) {
    return weight * _kilogramsToPoundsConversionValue;
  }

  static double poundsToKilograms({required double weight}) {
    return weight * (1 / _kilogramsToPoundsConversionValue);
  }

  static double centimetersToInches({required double length}) {
    return length * _centimetersToInchesConversionValue;
  }

  static double inchesToCentimeters({required double length}) {
    return length * (1 / _centimetersToInchesConversionValue);
  }
}
