/// Simple library for generating random ascii strings.

// ignore_for_file: one_member_abstracts

import 'dart:math' show Random;

const maxSupportedInteger = 999999999999999;
const minSupportedInteger = 0;
const asciiStart = 33;
const asciiEnd = 126;
const numericStart = 48;
const numericEnd = 57;
const lowerAlphaStart = 97;
const lowerAlphaEnd = 122;
const upperAlphaStart = 65;
const upperAlphaEnd = 90;

final _internal = Random();

// -- example --
// main() {
//   print(ExUtils.randomBetween(10, 20)); // some integer between 10 and 20 where 0 <= min <= max <= 999999999999999
//   print(ExUtils.randomNumeric(4)); // sequence of 4 random numbers i.e. 3259
//   print(ExUtils.randomString(10)); // random sequence of 10 characters i.e. e~f93(4l-
//   print(ExUtils.randomAlpha(5)); // random sequence of 5 alpha characters i.e. aRztC
//   print(ExUtils.randomAlphaNumeric(10)); // random sequence of 10 alpha numeric i.e. aRztC1y32B
//
//   var r = Random.secure();
//   print(ExUtils.randomBetween(10, 20, provider: CoreRandomProvider.from(r))); // You can use a provider from Random.
//   print(ExUtils.randomBetween(10, 20, provider: _Provider())); // Or you can implement your own.
// }

mixin ExUtils {
  /// Generates a random integer where [from] <= [to] inclusive
  /// where 0 <= from <= to <= 999999999999999
  static int randomBetween(int from, int to, {AbstractRandomProvider provider = const DefaultRandomProvider()}) {
    if (from > to) {
      throw ArgumentError('$from cannot be > $to');
    }
    if (from < minSupportedInteger) {
      throw ArgumentError('|$from| is larger than the maximum supported $maxSupportedInteger');
    }

    if (to > maxSupportedInteger) {
      throw ArgumentError('|$to| is larger than the maximum supported $maxSupportedInteger');
    }

    final d = provider.nextDouble();
    if (d < 0 || d >= 1) {
      throw ProviderError(d);
    }
    return _mapValue(d, from, to);
  }

  static int _mapValue(double value, int min, int max) {
    if (min == max) {
      return min;
    }
    final range = (max - min).toDouble();
    return (value * (range + 1)).floor() + min;
  }

  /// Generates a random string of [length] with characters
  /// between ascii [from] to [to].
  /// Defaults to characters of ascii '!' to '~'.
  static String randomString(int length, {int from = asciiStart, int to = asciiEnd, AbstractRandomProvider provider = const DefaultRandomProvider()}) {
    return String.fromCharCodes(List.generate(length, (index) => randomBetween(from, to, provider: provider)));
  }

  /// Generates a random string of [length] with only numeric characters.
  static String randomNumeric(int length, {AbstractRandomProvider provider = const DefaultRandomProvider()}) => randomString(length, from: numericStart, to: numericEnd, provider: provider);

  /// Generates a random string of [length] with only alpha characters.
  static String randomAlpha(int length, {AbstractRandomProvider provider = const DefaultRandomProvider()}) {
    var lowerAlphaWeight = provider.nextDouble();
    var upperAlphaWeight = provider.nextDouble();
    final sumWeight = lowerAlphaWeight + upperAlphaWeight;
    lowerAlphaWeight /= sumWeight;
    upperAlphaWeight /= sumWeight;
    final lowerAlphaLength = randomBetween(0, length, provider: provider);
    final upperAlphaLength = length - lowerAlphaLength;
    final lowerAlpha = randomString(lowerAlphaLength, from: lowerAlphaStart, to: lowerAlphaEnd, provider: provider);
    final upperAlpha = randomString(upperAlphaLength, from: upperAlphaStart, to: upperAlphaEnd, provider: provider);
    return randomMerge(lowerAlpha, upperAlpha);
  }

  /// Generates a random string of [length] with alpha-numeric characters.
  static String randomAlphaNumeric(int length, {AbstractRandomProvider provider = const DefaultRandomProvider()}) {
    final alphaLength = randomBetween(0, length, provider: provider);
    final numericLength = length - alphaLength;
    final alpha = randomAlpha(alphaLength, provider: provider);
    final numeric = randomNumeric(numericLength, provider: provider);
    return randomMerge(alpha, numeric);
  }

  /// Merge [a] with [b] and shuffle.
  static String randomMerge(String a, String b) {
    final mergedCodeUnits = List.from('$a$b'.codeUnits)..shuffle();
    return String.fromCharCodes(mergedCodeUnits.cast<int>());
  }
}

// —————————————————————————————————————————————————————————————————————————————
// internal class
// —————————————————————————————————————————————————————————————————————————————
/// A generator of double values.
abstract class AbstractRandomProvider {
  /// A non-negative random floating point value is expected
  /// in the range from 0.0, inclusive, to 1.0, exclusive.
  /// A [ProviderError] is thrown if the return value is < 0 or >= 1
  double nextDouble();
}

/// A generator of pseudo-random double values using the default [math.Random].
class DefaultRandomProvider with AbstractRandomProvider {
  const DefaultRandomProvider();

  @override
  double nextDouble() => _internal.nextDouble();
}

/// A generator of random values using a supplied [math.Random].
class CoreRandomProvider with AbstractRandomProvider {
  CoreRandomProvider.from(this.random);

  Random random;

  @override
  double nextDouble() => random.nextDouble();
}

/// ProviderError thrown when a [Provider] provides a value
/// outside the expected [0, 1) range.
class ProviderError implements Exception {
  ProviderError(this.value);

  final double value;

  @override
  String toString() => 'nextDouble() = $value, only [0, 1) expected';
}
