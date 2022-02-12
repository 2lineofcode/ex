part of collections;

/// The [repeat] method allows you to easily call a lambda a certain number of
/// times.
///
/// The simplest form of a [repeat] method:
///
/// ```dart
/// repeat(3, (it) => print('Hello $it!'));
/// ```
///
/// This is simply equivalent to a for loop that repeats 3 times
/// (starts at zero, increments by one).
///
/// Much simpler than dealing with iterators for most of scenarios where you
/// don't care about start, end, increment values. If you want more
/// flexibility, check the [range] function.
///
/// It also returns a list of results in case you need it:
///
/// ```dart
/// final evens = repeat(10, (e) => 2 * e);
/// ```
List<T> repeat<T>(int iterations, T Function(int index) lambda) {
  if (iterations == 0) {
    return [];
  }
  return range(0, until: iterations).map(lambda).toList();
}
