part of collections;

typedef ChunkedTransform<T, R> = R Function(T chunk);

class _Chunked<T, R> extends IterableBase<R> {

  _Chunked(
      this.iterable,
      this.size,
      this.transform,
      ) : assert(size > 0);

  final Iterable<T> iterable;
  final int size;
  final ChunkedTransform<List<T>, R> transform;



  @override
  Iterator<R> get iterator => _ChunkedIterator<T, R>(iterable.iterator, size, transform);
}

class _ChunkedIterator<T, R> implements Iterator<R> {

  _ChunkedIterator(this.iterator, this.size, this.transform);

  final Iterator<T> iterator;
  final int size;
  R? _current;
  final ChunkedTransform<List<T>, R> transform;

  @override
  R get current => _current!;


  @override
  bool moveNext() {
    final nextValue = <T>[];
    var count = 0;
    while (count < size && iterator.moveNext()) {
      nextValue.add(iterator.current);
      count++;
    }
    final value = (count > 0) ? nextValue : null;
    if (value == null) {
      _current = null;
      return false;
    }
    _current = transform(value);
    return _current != null;
  }
}

extension Chunked<T> on Iterable<T> {
  /// Splits into a list of lists, each not exceeding the given `size`.
  ///
  /// The last list may have less elements than the given `size`.
  ///
  /// The returned iterable will be lazy, it will only chunk the elements that
  /// are requested.
  ///
  /// ```dart
  /// final words = 'one two three four five six seven eight nine ten'.split(' ');
  /// final chunks = words.chunked(3);
  ///
  /// print(chunks); // ([one, two, three], [four, five, six], [seven, eight, nine], [ten])
  /// ```
  ///
  /// When the `transform` is given, it will be applied to each list.
  ///
  /// ```dart
  /// final numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  /// final chunkedAndReversed = numbers.chunked(3, (chunk) => chunk.reversed);
  ///
  /// print (chunkedAndReversed); // ([3, 2, 1], [6, 5 ,4], [9, 8 ,7], [10])
  /// ```
  Iterable<R> chunked<R>(int size, [ChunkedTransform<List<T>, R>? transform]) {
    transform ??= (v) => v as R;

    return _Chunked<T, R>(this, size, transform);
  }
}
