part of text;

extension AssociateString on String {
  /// Returns a `Map` containing key-value pairs that are provided by
  /// `transform`.
  ///
  /// If any of the returned `Pair`s would contain the same key, the last one
  /// gets added to the map.
  ///
  /// The iteration order of the string is preserved.
  ///
  /// ```dart
  /// final string = 'bonne journée';
  /// // Associate each character with its code.
  /// final result = string.associate((char) => Pair(char, char.codeUnitAt(0)));
  ///
  /// // Notice each letter occurs only once.
  /// print(result); // {b: 98, o: 111, n: 110, e: 101,  : 32, j: 106, u: 117, r: 114, é: 233}
  /// ```
  Map<K, V> associate<K, V>(Pair<K, V> Function(String value) transform) {
    return split('').associate(transform);
  }

  /// Returns a `Map` containing the charachters from the string indexed by the
  /// key from `keySelector`.
  ///
  /// If any of the returned keys would contain the same key, the last one gets
  /// added to the map.
  ///
  /// The iteration order of the string is preserved.
  ///
  /// ```dart
  /// final string = 'bonne journée';
  /// // Associate each character with its code.
  /// final result = string.associateBy((char) => char.codeUnitAt(0));
  ///
  /// // Notice each letter occurs only once.
  /// print(result); // {98: 'b', 111: 'o', 110: 'n', 101: 'e', 32: ' ', 106: 'j', 117: 'u', 114: 'r', 233: 'é'}
  /// ```
  Map<K, String> associateBy<K, V>(K Function(String value) keySelector) {
    return split('').associateBy(keySelector);
  }
}
