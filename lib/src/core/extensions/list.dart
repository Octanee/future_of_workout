extension RandomList<E> on List<E> {
  E random() {
    final temp = List.of(this);
    temp.shuffle();
    return temp.first;
  }
}
