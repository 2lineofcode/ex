part of collections;

extension RangeNum<T extends num> on T {
  /// Returns a range from this value down to the specified to value with the
  /// step.
  List<T> downTo(T downTo, {T? step}) =>
      range(this, downTo: downTo, step: step);

  /// Returns a range from this value up to and including the specified `to`
  /// value.
  List<T> to(T to, {T? step}) => range(this, to: to, step: step);

  /// Returns a range from this value up to but excluding the specified `to`
  /// value.
  List<T> until(T until, {T? step}) => range(this, until: until, step: step);
}
