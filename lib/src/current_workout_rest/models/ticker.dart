import 'dart:async';

class Ticker {
  const Ticker();

  Stream<int> tick({required int ticks}) {
    const duration = Duration(seconds: 1);
    return Stream.periodic(duration, (x) => ticks - x - 1).take(ticks);
  }
}
