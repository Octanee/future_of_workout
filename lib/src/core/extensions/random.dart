import 'dart:math';

extension RandomRange on Random {
  int randomRange(int min, int max) {
    final random = Random();

    final value = min + random.nextInt(max - min);

    return value;
  }
}
