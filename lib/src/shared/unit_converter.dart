import 'package:future_of_workout/src/shared/shared.dart';
import 'package:user_repository/user_repository.dart';

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

  static double dispalyedWeight({
    required WeightUnit unit,
    required double value,
  }) {
    switch (unit) {
      case WeightUnit.kilogram:
        return value.toPrecision(1);
      case WeightUnit.pounds:
        return kilogramsToPounds(weight: value).toPrecision(1);
    }
  }

  static double dataWeight({
    required WeightUnit unit,
    required double value,
  }) {
    switch (unit) {
      case WeightUnit.kilogram:
        return value;
      case WeightUnit.pounds:
        return poundsToKilograms(weight: value);
    }
  }

  static double dispalyedHeight({
    required LengthUnit unit,
    required double value,
  }) {
    switch (unit) {
      case LengthUnit.centimeter:
        return value.toPrecision(1);
      case LengthUnit.inch:
        return centimetersToInches(length: value).toPrecision(2);
    }
  }

  static double dataHeight({
    required LengthUnit unit,
    required double value,
  }) {
    switch (unit) {
      case LengthUnit.centimeter:
        return value;
      case LengthUnit.inch:
        return inchesToCentimeters(length: value);
    }
  }
}
