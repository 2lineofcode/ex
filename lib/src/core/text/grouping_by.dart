part of text;

extension GroupingByString on String {
  /// Group elements by a key.
  ///
  /// It creates a `Grouping` using the specified `keySelector` to extract a
  /// key from each character.
  ///
  /// It can then be used with one of its group-and-fold operations.
  ///
  /// ```dart
  /// final words = 'one two three four five six seven eight nine ten';
  /// final frequenciesByFirstChar =
  ///     words.groupingBy((value) => value[0]).eachCount();
  ///
  /// print('Counting first letters:');
  /// print(frequenciesByFirstChar); // {o=1, t=3, f=2, s=2, e=1, n=1}
  /// ```
  Grouping<String, K> groupingBy<K>(K Function(String value) keySelector) {
    return split('').groupingBy(keySelector);
  }
}
