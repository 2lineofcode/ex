extension Unique<E, Id> on List<E> {
  List<E> unique([Id Function(E element)? id, bool inplace = true]) {
    final ids = <dynamic>{};
    final list = inplace ? this : List<E>.from(this)
      ..retainWhere((x) => ids.add(id != null ? id(x) : x as Id));
    return list;
  }

  List<E> limitLength(int maxLength) {
    return (length <= maxLength) ? this : sublist(0, maxLength);
  }
}
