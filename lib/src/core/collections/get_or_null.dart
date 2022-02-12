part of collections;

extension GetOrNull<T> on Iterable<T> {
  /// Returns the element of position index of the list or null if index
  /// is out of bounds.
  ///
  /// Note: beware that using this on a non-List Iterable this will have to
  /// iterate the list, similar to elementAt.
  T? getOrNull(int index) {
    if (index >= 0 && index < length) {
      return elementAt(index);
    }
    return null;
  }
}
