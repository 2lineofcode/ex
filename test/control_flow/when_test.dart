import 'package:ex/ex.dart';
import 'package:ex/src/core/collections.dart' show range;
import 'package:flutter_test/flutter_test.dart' show test, expect;

void main() {
  test('Should return the correct value in the simplest form', () {
    String? testWhen(int value) {
      return when(value, {
        1: () => '1',
        2: () => '2',
      }).orElse(() => 'else');
    }

    expect(testWhen(1), '1');
    expect(testWhen(2), '2');
    expect(testWhen(3), 'else');
  });

  test('Should return the correct value when given a list of possible options',
      () {
    String? testWhen(int value) {
      return when<dynamic, String>(value, {
        [1, 2]: () => '1',
        2: () => '3', // Should never reach.
      }).orElse(() => 'else');
    }

    expect(testWhen(1), '1');
    expect(testWhen(2), '1');
    expect(testWhen(3), 'else');
  });

  test('Should handle when check methods correctly', () {
    String? testWhen(int value) {
      return when(value, {
        isIn(range(0, to: 10)): () => '1',
        isNotIn(range(10, to: 20)): () => '2',
      }).orElse(() => 'else');
    }

    expect(testWhen(1), '1');
    expect(testWhen(2), '1');
    expect(testWhen(22), '2');
    expect(testWhen(11), 'else');
  });
}
