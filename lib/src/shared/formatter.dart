import 'package:flutter/services.dart';

class NumericalRangeFormatter extends TextInputFormatter {
  NumericalRangeFormatter({required this.min, required this.max});

  final int min;
  final int max;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text == '') {
      return newValue;
    } else if ((int.tryParse(newValue.text) ?? double.parse(newValue.text)) <
        min) {
      return TextEditingValue(text: min.toString());
    } else {
      return (int.tryParse(newValue.text) ?? double.parse(newValue.text)) > max
          ? oldValue
          : newValue;
    }
  }
}
