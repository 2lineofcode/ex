// ignore_for_file: null_check_on_nullable_type_parameter

part of control_flow;

/// [takeIf] returns the current value if the given block is satisifed, will
/// return `null` if not.
///
/// [takeIf] is a filtering function for a single object.
///
/// ```dart
/// final number = Random().nextInt(10);
/// final evenOrNull = number.takeIf((it) => it % 2 == 0);
/// print('even: $evenOrNull');
/// ```
///
/// When chaining other functions after [takeIf], don't forget to use the `?.`
/// safe call or perform a null check.
extension TakeIf<T> on T? {
  /// Return the current value if the given block is satisifed, will return
  /// `null` if not.
  T? takeIf(bool Function(T it) block) {
    if (this != null && block(this!)) {
      return this;
    }
    return null;
  }
}
