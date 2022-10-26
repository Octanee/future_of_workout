import 'package:flutter/material.dart';

extension DarkenAndLighten on Color {
  Color darken({double amount = 0.1}) {
    assert(amount >= 0 && amount <= 1, 'Amount should be between 0 and 1');

    final hsl = HSLColor.fromColor(this);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

    return hslDark.toColor();
  }

  Color lighten({double amount = 0.1}) {
    assert(amount >= 0 && amount <= 1, 'Amount should be between 0 and 1');

    final hsl = HSLColor.fromColor(this);
    final hslLight =
        hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));

    return hslLight.toColor();
  }
}

extension EmptyString on String {
  String withDefault([String defaultValue = '']) {
    final temp = isEmpty ? defaultValue : this;
    return temp;
  }
}

extension TodayDateTime on DateTime {
  DateTime toDay() {
    return DateTime(year, month, day);
  }

  bool isTheSameDay(DateTime date) {
    return difference(date).inDays == 0;
  }

  bool isToday() {
    return isTheSameDay(DateTime.now());
  }
}

extension Precision on double {
  double toPrecision(int precision) {
    return double.parse(toStringAsFixed(precision));
  }
}
