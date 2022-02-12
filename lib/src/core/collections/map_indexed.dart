part of collections;

extension MapIndexed<T> on Iterable<T> {
  /// Maps an Iterable (like map), but you have access to both
  /// the element and the index on the mapping function.
  Iterable<V> mapIndexed<V>(V Function(int, T) mapper) {
    var i = 0;
    return map((item) => mapper(i++, item));
  }
}
