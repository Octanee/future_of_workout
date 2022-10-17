/// An extension to DateTime that converts an object to a String as a key.
extension KeyDateTime on DateTime {
  /// Convert DateTime to String `key`.
  String toKey() {
    return '$year-$month-$day';
  }
}

/// An extension to String that convers an key object to DateTime.
extension KeyString on String {
  /// Convert String `key` to DateTime.
  DateTime toDateTime() {
    final list = split('-');
    final year = int.parse(list[0]);
    final month = int.parse(list[1]);
    final day = int.parse(list[2]);
    return DateTime(year, month, day);
  }
}
