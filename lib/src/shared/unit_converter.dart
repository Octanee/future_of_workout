class UnitConverter {
  const UnitConverter._();

  static const double _kilogramsToPoundsConversionValue = 2.2;
  static const double _inchesToCentimetersConversionValue = 2.54;

  static double kilogramsToPounds({required double weight}) {
    return weight * _kilogramsToPoundsConversionValue;
  }

  static double poundsToKilograms({required double weight}) {
    return weight * (1 / _kilogramsToPoundsConversionValue);
  }

  static double centimetersToInches({required double length}) {
    return length * (1 / _inchesToCentimetersConversionValue);
  }

  static double inchesToCentimeters({required double length}) {
    return length * _inchesToCentimetersConversionValue;
  }
}
