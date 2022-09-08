import 'package:flutter/material.dart';

import 'package:future_of_workout/src/core/extensions/extensions.dart';

enum Fatigue {
  fatigue0(color: Color(0xFFf2efe6)),
  fatigue20(color: Color(0xFFf4e0b5)),
  fatigue40(color: Color(0xFFf5d084)),
  fatigue55(color: Color(0xFFf6c45d)),
  fatigue70(color: Color(0xFFf7bf4d)),
  fatigue85(color: Color(0xFFfaa805)),
  fatigue100(color: Color(0xFFee2222));

  const Fatigue({required this.color});
  final Color color;

  static Fatigue random() {
    return Fatigue.values.random();
  }
}
