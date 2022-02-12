part of collections;

/// Creates [progression](https://en.wikipedia.org/wiki/Arithmetic_progression)
/// ranges of given type value.
///
/// Generally used in `for` loops:
///
/// ```dart
/// for (var i in range(1, to: 4)) {
///   print(i);
/// }
/// ```
///
/// To iterate in a reverse order, use the [downTo] argument:
///
/// ```dart
/// for (var i in range(4, downTo: 1)) {
///   print(1);
/// }
/// ```
///
/// To iterate with an arbitrary step, use the [step] argument:
///
/// ```dart
/// for (var i in range(1, to: 8, step: 2)) {
///   print(i);
/// }
///
/// for (var i in range(8, downTo: 1, step: 2)) {
///   print(i);
/// }
/// ```
///
/// To iterate a range which does not include the end element, use the [until]
/// argument:
///
/// ```dart
/// for (var i in range(1, until: 10)) {
///   print(i);
/// }
/// ```
List<T> range<T extends num>(T value, {T? to, T? until, T? downTo, T? step}) {
  assert(
    (to != null && until == null && downTo == null) ||
        (to == null && until != null && downTo == null) ||
        (to == null && until == null && downTo != null),
    'Either the `to`, `until` or `downTo` argument is required',
  );
  assert(
    step != null && !step.isNegative || step == null,
    'The `step` should be a positive number',
  );
  assert(
    (to != null && value <= to) ||
        (until != null && value < until) ||
        (downTo != null && value >= downTo),
    'Range out of bound',
  );

  step ??= 1 as T;
  num val = value;
  final list = <T>[];

  if (downTo != null) {
    for (; val >= downTo; val -= step) {
      list.add(val as T);
    }
  } else if (until != null) {
    for (; val < until; val += step) {
      list.add(val as T);
    }
  } else if (to != null) {
    for (; val <= to; val += step) {
      list.add(val as T);
    }
  }

  return list;
}
