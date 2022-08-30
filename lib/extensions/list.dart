extension RandomElement<E> on List<E> {
  E random() {
    final temp = List.of(this);
    temp.shuffle();
    return temp.first;
  }

  Iterable<E> randomRange({required int range}) {
    final temp = List.of(this);
    temp.shuffle();
    return temp.getRange(0, range);
  }
}
