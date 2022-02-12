part of collections;

class Pair<T, V> {
  const Pair(this.key, this.value);

  final T key;

  final V value;
}

extension Associate<T> on Iterable<T> {
  /// Returns a `Map` containing key-value pairs that are provided by
  /// `transform`.
  ///
  /// If any of the returned `Pair`s would contain the same key, the last one
  /// gets added to the map.
  ///
  /// The iteration order of the list is preserved.
  ///
  /// ```dart
  /// final charCodes = [72, 69, 76, 76, 79];
  /// final byCharCode = charCodes.associate(
  ///   (code) => Pair(code, String.fromCharCode(code)),
  /// );
  ///
  /// // 76: L only occurs once because only the last same key gets added.
  /// print(byCharCode); // {72: 'H', 69: 'E', 76: 'L', 79: 'O'}
  /// ```
  ///
  /// ```dart
  /// final names = ['Grace Hopper', 'Jacob Bernoulli', 'Johann Bernoulli'];
  ///
  /// final byLastName = names.associate((value) {
  ///   final split = value.split(' ');
  ///   return Pair(split[1], split[0]);
  /// });
  ///
  /// // Jacob Bernoulli does not occur, because the same key gets overwritten.
  /// print(byLastName); // {Hopper: Grace, Bernoulli: Johann}
  /// ```
  Map<K, V> associate<K, V>(Pair<K, V> Function(T value) transform) {
    return {for (final e in map(transform)) e.key: e.value};
  }

  /// Returns a `Map` containing the elements indexed by the key from
  /// `keySelector`.
  ///
  /// If any of the returned keys would contain the same key, the last one
  /// gets added to the map.
  ///
  /// The iteration order of the list is preserved.
  ///
  /// ```dart
  /// final charCodes = [72, 69, 76, 76, 79];
  /// final byCharCode = charCodes.associateBy(
  ///   (code) => String.fromCharCode(code),
  /// );
  ///
  /// // L: 76 only occurs once because only the last same key gets added.
  /// print(byCharCode); // {'H': 72, 'E': 69, 'L': 76, 'O': 79}
  /// ```
  ///
  /// ```dart
  /// class Person {
  ///   const Person(this.firstName, this.lastName);
  ///
  ///   final String firstName;
  ///
  ///   final String lastName;
  ///
  ///   @override
  ///   String toString() => '$firstName $lastName';
  /// }
  ///
  /// final scientists = [
  ///   Person('Grace', 'Hopper'),
  ///   Person('Jacob', 'Bernoulli'),
  ///   Person('Johann', 'Bernoulli'),
  /// ];
  ///
  /// final byLastName = scientists.associateBy((value) => value.lastName);
  ///
  /// // Jacob Bernoulli does not occur, because the same key gets overwritten.
  /// print(byLastName); // {Hopper: Grace Hopper, Bernoulli: Johann Bernoulli}
  /// ```
  Map<K, T> associateBy<K>(K Function(T value) keySelector) {
    return associate((value) => Pair(keySelector(value), value));
  }

  /// Returns a `Map` containing the elements paired with the value from
  /// `valueSelector`.
  ///
  /// If the source list contains duplicated keys, only one of them will
  /// be left on the map.
  ///
  /// The iteration order of the list is preserved.
  ///
  /// ```dart
  /// final charCodes = [72, 69, 76, 76, 79]; // second 76 is ignored
  /// final fromCharCode = charCodes.associateWith(
  ///   (code) => String.fromCharCode(code),
  /// );
  ///
  /// print(fromCharCode); // {72: 'H', 69: 'E', 76: 'L', 79: 'O'}
  /// ```
  ///
  /// ```dart
  /// class Person {
  ///   const Person(this.firstName, this.lastName);
  ///
  ///   final String firstName;
  ///
  ///   final String lastName;
  ///
  ///   @override
  ///   String toString() => '$firstName $lastName';
  /// }
  ///
  /// final scientists = [
  ///   Person('Grace', 'Hopper'),
  ///   Person('Jacob', 'Bernoulli'),
  ///   Person('Johann', 'Bernoulli'),
  /// ];
  ///
  /// final byName = scientists.associateWith((value) => value.lastName);
  ///
  /// print(byName); // {Grace Hopper: Hopper, Jacob Bernoulli: Bernoulli, Johann Bernoulli: Bernoulli}
  /// ```
  Map<T, V> associateWith<V>(V Function(T value) valueSelector) {
    return associate((key) => Pair(key, valueSelector(key)));
  }
}
