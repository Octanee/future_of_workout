extension RandomList<E> on List<E> {
  E random() {
    final temp = List.of(this);
    temp.shuffle();
    return temp.first;
  }
}

extension UpdateList<E> on List<E> {
  void update(bool test(E element), {required E element}) {
    final index = indexWhere(test);

    if (index == -1) return;

    this[index] = element;
  }
}
