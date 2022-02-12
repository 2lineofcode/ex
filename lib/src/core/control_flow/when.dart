part of control_flow;

/// [when] defines a conditional expression with multiple branches.
///
/// It is similar to the `switch` statement in Dart. In its simplest form it
/// looks like this:
///
/// ```dart
/// when(x, {
///   1: () => print('x == 1'),
///   2: () => print('x == 2'),
/// }).orElse(() => print('x is neither 1 nor 2'));
/// ```
///
/// [when] matches its argument against all branches sequantially until a
/// branch condition is satisified.
///
/// [when] can be used either as an expression, or as a statement. If it is
/// used as an expression, the value of the satisfied branch
/// becomes the value of the expression. And if it is used as a statement, the
/// values of the branches are ignored.
///
/// If none of the branches matched it will return `null`. The [OrElse] can be
/// used for returning a value when it returned `null`.
///
/// If many cases should be handled the same way, the branch condition can be
/// a `List`:
///
/// ```dart
/// when(x, {
///   [0, 1]: () => print('x == 0 or x == 1'),
/// }).orElse(() => print('otherwise'));
/// ```
///
/// Unlike the switch statement in dart, we can use arbitary expressions as
/// branch conditions:
///
/// ```dart
/// when(x, {
///   int.parse(s): () => print('s encodes x'),
/// }).orElse(() => print('s does not encode x'));
/// ```
///
/// Using the [isIn] and [isNotIn] methods we can also check if the value is
/// in a `List`:
///
/// ```dart
/// when(x, {
///   isIn(range(0, to: 10)): () => print('x is in the range'),
///   isIn(validNumbers): () => print('x is valid'),
///   isNotIn(range(10, to: 20)): () => print('x is outside the range'),
/// }).orElse(() => print('none of the above'));
/// ```
///
/// It is also possible to check if a value [isType] or [isNotType]:
///
/// ```dart
/// bool hasPrefix(dynamic x) {
///   return when(x, {
///     isType<String>(): () => x.startsWith('prefix'),
///   }).orElse(() => false);
/// }
/// ```
///
/// **Note**: There is currently no smartcasting in place so you might not get
/// autocompletion on methods and properties of the given type.
///
/// If you need smartcasting you can supply the [T] and [V] type arguments.
V? when<T, V>(T value, Map<T, V Function()> branches) {
  assert(branches.isNotEmpty);

  for (final key in branches.keys) {
    if ((key == value) ||
        (key is List && key.contains(value)) ||
        (key is _WhenCheck && key(value))) {
      final branch = branches[key];
      if (branch != null) {
        return branch();
      }
    }
  }
  return null;
}
