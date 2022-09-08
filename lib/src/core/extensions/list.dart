extension RandomList<E> on List<E> {
  E random() {
    final temp = List.of(this)..shuffle();
    return temp.first;
  }
}
