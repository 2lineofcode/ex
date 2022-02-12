part of collections;

extension GetOrPut<K, V> on Map<K, V> {
  /// Returns the value for the given key. If the key is not found in the map,
  /// calls the defaultValue function, puts its result into the map under the
  /// given key and returns it.
  ///
  /// **Note**: If the type `V` is nullable and `defaultValue` returns null, it
  /// will not be stored as a value for `key`.
  V getOrPut(K key, V Function(K value) defaultValue) {
    final value = this[key];
    if (value == null) {
      final answer = defaultValue(key);
      this[key] = answer;
      return answer;
    } else {
      return value;
    }
  }
}
