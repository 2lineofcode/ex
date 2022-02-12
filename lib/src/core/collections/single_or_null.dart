part of collections;

extension SingleOrNull<T> on Iterable<T> {
  /// Returns the single element of a `length = 1` list or null otherwise.
  ///
  /// Optionally provide a test function; in that case it functions just
  /// like singleWhere but returns null instead of error if no or more than
  /// one element matches (or the list is empty).
  T? singleOrNull([bool Function(T)? test]) {
    test ??= (_) => true;

    T? result;
    var foundMatching = false;
    for (final element in this) {
      if (test(element)) {
        if (foundMatching) {
          // more than one match
          return null;
        }
        result = element;
        foundMatching = true;
      }
    }
    return result;
  }
}
