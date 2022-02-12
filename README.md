![Ex](assets/ex.png)

## Introduction

Ex is heavily inspired by [Kotlin](https://kotlinlang.org), therefore Ex tries to bring the ease of data manipulation and clean code from Kotlin to Dart.

### Feature
- Scope Function (let, also, run, takeIf, takeUnless) fully like kotlin
- when, iff, tryy Expression fully like kotlin
- Widgets ExComponent
- ExLog, ExAlert, ExBottomSheet, ExLoading, ExImagePreview, ExUtils 
- Sealed Class fully like kotlin
- 

### What it does

Ex is a helper library that provides the following concepts:
- Writing "cleaner" code by adding readable control-flow methods that are able to replace the standard Dart control-flow statements. See [Control flow](#control-flow) for more information.
- Adds extension methods to existing Dart types for better and easier data manipulation. See [Data manipulation](#data-manipulation) for more information.
- Provides methods to easily create data sets of certain types.

### What it does not do

Ex is **not** a performance library, the methods it provides exist to help the developer, and to keep their code clean and readable. Readability does not equal performance optimization, so if you are looking to optimize your code, this is not the library for you.

**Note**: Ex tries to keep the performance of the provided methods as good as possible but they are not being benchmarked in any way. Most of the methods rely on [closures](https://dart.dev/guides/language/language-tour#anonymous-functions) to work.


### Current libraries
Ex provides different libraries that you can import:
```dart
import 'package:ex/ex.dart';
```

## Common Usage

### Scope Function

#### .let

.let can be used to invoke one or more functions on results of call chains.

```dart
final defValue = 10;
var result = defValue.let((it) {
  final b = 5;
  return it + b + 5;
});

print(result);
```

#### .also

also is good for performing some actions that take the context object as an argument.

```dart
List result = [];
result.also((it) {
  final b = 10;
  it.add(b);
  it.add(5);
});

print(result);
```

#### .takeIf

takeIf returns object self if it matches the predicate. Otherwise, it returns null.

```dart
List ref = ["data"];
var result = ref.takeIf((it) {
  return it.isNotEmpty;
});

print(result);
```


### Control flow

The Ex `control_flow` library provides methods for writing cleaner and more controllable code, these control flow methods can be used as a replacement for existing [control flow statements](https://dart.dev/guides/language/language-tour#control-flow-statements) or in combination with them.

**Note**: Dart already provides a few interesting control flow operations for `List`s and `Map`s. So before you decide to use Ex, first read more about [collection operators](https://dart.dev/guides/language/language-tour#collection-operators). It may already suit your needs.

#### if-statement as expressions

The `iff` method works like the if statement, but with the added bonus of being able to write them as expressions. You can use them to replace complex ternary operators with a readable if-like statement:

```dart
final x = iff(a < b, () {
  return a;
}).elseIf(a == b, () {
  return 0;
}).orElse(() {
  return b;
});
```

The `iff` method is null-aware. This means that the type of the returned value from the `block` is expected as a non-nullable type for the blocks of the `elseIf` and `orElse` methods.

See the [iff](https://pub.dev/documentation/ex/latest/control_flow/iff.html) docs for more information.

#### switch-like statements as expressions

The `when` method replaces the switch statement. And can be used to write expressions:

```dart
final result = when(place, {
  1: () => CompetitionPlace.first,
  2: () => CompetitionPlace.second,
  3: () => CompetitionPlace.third,
  [4,5]: () => CompetitionPlace.honourableMentions,
}).orElse(() => CompetitionPlace.others);
```

See the [when](https://pub.dev/documentation/ex/latest/control_flow/when.html) docs for more information.

#### try-statement as expressions

The `tryy` method works like the tryy statement, but with the added bonus of being able to write them as expressions. Allowing you to catch multiple exceptions and depending on those exceptions return different values:

```dart
final x = tryy(() {
  return aMethodThatCouldFail();
}, catches: {
  On<SomeException>: () {
    return 1;
  },
  On<OtherException>: () {
    return 2;
  }
});
```

See the [tryy](https://pub.dev/documentation/ex/latest/control_flow/tryy.html) docs for more information.

### Data manipulation

#### Creating progression ranges

The `range` method allows the user to easily create a lists of certain `num` types. While being able to define the start value, the end value, the steps it should take to reach the end value and if it should be created in reverse or not:

```dart
// [0, 1, 2, 3, 4]
final list1 = range(0, to: 4);

// [4, 3, 2, 1, 0]
final list2 = range(4, downTo: 0); 

// [1, 3, 5, 7]
final list3 = range(1, to: 8, step: 2);

// [1, 2, 3]
final list4 = range(0, until: 4);
```

See the [range](https://pub.dev/documentation/ex/latest/collections/range.html) docs for more information.

# Development and Contributing
Interested in contributing? We love merge requests! See the [Contribution](https://gitlab.com/wolfenrain/ex/blob/master/CONTRIBUTING.md) guidelines.