// ignore_for_file: null_check_on_nullable_type_parameter

part of collections;

/// A function that is invoked on each element.
///
/// The parameters are as followed:
/// - The [key] is the key of the group this element belongs to.
/// - The [accumulator] is the current value of the accumulator of the group.
///   Can be `null` if it is the first [element] encountered in the group.
/// - The [element] is the element from the source that is being aggregated.
/// - And [first] indicates whether it's the first [element] encountered in
///   the group.
typedef AggregateOperation<T, K, R> = R Function(
  K key,
  R? accumulator,
  T element,
  bool first,
);

/// Serves as an step between grouping and folding operations.
///
/// It groups elements by their key and then allows you to fold each group with
/// some aggregating operation.
///
/// To get an instance use the [GroupingBy] extension method.
class Grouping<T, K> {


  Grouping._construct(this._source, this.group);

  final Iterable<T> _source;

  /// Returns a new [Iterator] for the source of this grouping.
  Iterator<T> get sourceIterator => _source.iterator;

  final Map<K, List<T>> group;

  K? operator [](T element) {
    return group.keys.firstOrNull((key) {
      return group[key]?.contains(element) == true;
    });
  }

  //#region Aggregating methods

  /// For each group the [operation] is applied to the elements of that group
  /// sequentially.
  ///
  /// The previous accumulated value is passed and the current element. The
  /// result per group is stored in a new map.
  ///
  /// The key for each element is provided by the `[](T element)` operator.
  ///
  /// ```dart
  /// final numbers = [3, 4, 5, 6, 7, 8, 9];
  ///
  /// final aggregated = numbers
  ///     .groupingBy((value) => value % 3)
  ///     .aggregate((key, accumulator, element, first) {
  ///   return first ? '$key:$element' : '$accumulator-$element';
  /// });
  ///
  /// print(aggregated.values); // (0:3-6-9, 1:4-7, 2:5-8)
  /// ```
  Map<K, R> aggregate<R>(AggregateOperation<T, K, R> operation) {
    return aggregateTo({}, operation);
  }

  /// For each group the [operation] is applied to the elements of that group
  /// sequentially.
  ///
  /// The previous accumulated value is passed and the current element. The
  /// result per group is stored in the given [destination] map.
  ///
  /// The key for each element is provided by the `[](T element)` operator.
  ///
  /// ```dart
  /// final numbers = [3, 4, 5, 6, 7, 8, 9];
  ///
  /// final aggregated = numbers
  ///     .groupingBy((value) => value % 3)
  ///     .aggregateTo({}, (key, accumulator, element, first) {
  ///   return first ? '$key:$element' : '$accumulator-$element';
  /// });
  ///
  /// print(aggregated.values); // (0:3-6-9, 1:4-7, 2:5-8)
  /// ```
  ///
  /// If the [destination] map already has a value corresponding to a key,
  /// then the elements that are being aggregated for that key will never be
  /// considered as [first].
  Map<K, R> aggregateTo<R>(
    Map<K, R> destination,
    AggregateOperation<T, K, R> operation,
  ) {
    final it = sourceIterator;
    while (it.moveNext()) {
      final key = this[it.current]!;
      destination[key] = operation(
        key,
        destination[key],
        it.current,
        destination[key] == null,
      );
    }
    return destination;
  }

  /// Groups elements by key and counts the elements in each group.
  ///
  /// ```dart
  /// final words = 'one two three four five six seven eight nine ten'.split(' ');
  /// final frequenciesByFirstChar =
  ///     words.groupingBy((value) => value[0]).eachCount();
  ///
  /// print('Counting first letters:');
  /// print(frequenciesByFirstChar); // {o=1, t=3, f=2, s=2, e=1, n=1}
  /// ```
  Map<K, int> eachCount() {
    return group.map((key, value) => MapEntry(key, value.length));
  }

  /// Groups elements by key and counts the elements in each group to the
  /// given map.
  ///
  /// If the [destination] already has a value for a given key, that value is
  /// used as an initial value.
  ///
  /// ```dart
  /// final words = 'one two three four five six seven eight nine ten'.split(' ');
  /// final frequenciesByFirstChar =
  ///     words.groupingBy((value) => value[0]).eachCount();
  ///
  /// print('Counting first letters:');
  /// print(frequenciesByFirstChar); // {o=1, t=3, f=2, s=2, e=1, n=1}
  ///
  /// final moreWords = 'eleven twelve'.split(' ');
  /// final moreFrequencies = moreWords
  ///     .groupingBy((value) => value[0])
  ///     .eachCountTo(frequenciesByFirstChar);
  ///
  /// print(moreFrequencies); // {o=1, t=4, f=2, s=2, e=2, n=1}
  /// ```
  Map<K, int> eachCountTo(Map<K, int> destination) {
    final count = eachCount();
    return {...destination, ...count}.map((key, _) {
      return MapEntry(key, (destination[key] ?? 0) + (count[key] ?? 0));
    });
  }
  //#endregion

  @override
  String toString() => group.toString();
}

extension GroupingBy<T> on Iterable<T> {
  /// Group elements by a key.
  ///
  /// It creates a `Grouping` using the specified `keySelector` to extract a
  /// key from each element.
  ///
  /// It can then be used with one of its group-and-fold operations.
  ///
  /// ```dart
  /// final words = 'one two three four five six seven eight nine ten'.split(' ');
  /// final frequenciesByFirstChar =
  ///     words.groupingBy((value) => value[0]).eachCount();
  ///
  /// print('Counting first letters:');
  /// print(frequenciesByFirstChar); // {o=1, t=3, f=2, s=2, e=1, n=1}
  /// ```
  Grouping<T, K> groupingBy<K>(K Function(T value) keySelector) {
    return Grouping._construct(
      this,
      fold({}, (group, element) {
        (group[keySelector(element)] ??= []).add(element);
        return group;
      }),
    );
  }
}
