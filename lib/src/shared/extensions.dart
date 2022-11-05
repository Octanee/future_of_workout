import 'package:future_of_workout/src/common.dart';

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

extension DateTimeExtension on DateTime {
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

extension DoubleExtension on double {
  double toPrecision(int precision) {
    return double.parse(toStringAsFixed(precision));
  }
}

extension BuildContextExtension on BuildContext {
  AppLocalizations get local => AppLocalizations.of(this)!;
}

extension StringExtension on String {
  String withDefault([String defaultValue = '']) {
    final temp = isEmpty ? defaultValue : this;
    return temp;
  }

  String capitalize() {
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }
}
