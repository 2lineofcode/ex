part of collections;

extension MapNotNull<T> on Iterable<T> {
  /// Maps an Iterable (like map), but filters out any null values
  /// and cast the resulting Iterable to be null-safe.
  Iterable<V> mapNotNull<V>(V? Function(T) mapper) {
    return map(mapper).filterNotNull();
  }
}
