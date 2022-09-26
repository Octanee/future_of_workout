import 'dart:async';

class Ticker {
  const Ticker();

  Stream<int> tick({required int time}) {
    const duration = Duration(seconds: 1);
    return Stream.periodic(duration, (x) => x + time);
  }

  Stream<int> countdown({required int time}) {
    const duration = Duration(seconds: 1);
    return Stream.periodic(duration, (x) => time - x - 1).take(time);
  }
}
