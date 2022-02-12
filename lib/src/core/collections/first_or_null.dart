part of collections;

extension FirstOrNull<T> on Iterable<T> {
  /// Returns the first element of the list or null if empty.
  ///
  /// Optionally provide a test function; in that case it functions just
  /// like firstWhere but returns null instead of error if no element
  /// matches (or the list is empty).
  ///
  /// The T response parameter here is optional (T?).
  T? firstOrNull([bool Function(T)? test]) {
    test ??= (_) => true;
    for (final element in this) {
      if (test(element)) {
        return element;
      }
    }
    return null;
  }
}
