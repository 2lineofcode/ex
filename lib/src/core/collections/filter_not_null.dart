part of collections;

extension FilterNotNull<T> on Iterable<T?> {
  /// Given an Iterable on a nullable type T?, filters out
  /// any null elements and cast the resulting Iterable to
  /// Iterable<T>.
  Iterable<T> filterNotNull() {
    return where((e) => e != null).cast();
  }
}
