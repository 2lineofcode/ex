// ignore_for_file: library_private_types_in_public_api

part of control_flow;

typedef _WhenCheck = bool Function<T>(T value);

/// Allows for checking if a [when] value is in a list.
_WhenCheck isIn<T>(Iterable<T> list) => <T>(value) => list.contains(value);

/// Allows for checking if a [when] value is not in a list.
_WhenCheck isNotIn<T>(Iterable<T> list) => <T>(value) => !list.contains(value);

/// Allows for checking if a [when] value is of a certain type.
_WhenCheck isType<V>() => <T>(value) => value is V;

/// Allows for checking if a [when] value is not of a certain type.
_WhenCheck isNotType<V>() => <T>(value) => value is! V;
