import 'package:ex/src/core/collections.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Should throw an assert error if missing one of the required paremeters',
      () {
    expect(() => range(1), throwsAssertionError);
  });

  test('Should throw an assert error if range is out of bounds', () {
    expect(() => range(1, downTo: 2), throwsAssertionError);
    expect(() => range(4, to: 3), throwsAssertionError);
    expect(() => range(4, until: 4), throwsAssertionError);
  });

  test('Should throw an assert error when given a negative step value', () {
    expect(() => range(4, downTo: 1, step: -2), throwsAssertionError);
  });

  test('Creates a list starting at 1 and counts up to 4 with a increment of 1',
      () {
    final list = range(1, to: 4);
    expect(list, [1, 2, 3, 4]);
  });

  test(
      'Creates a list starting at 4 and counts down to 1 with a increment of 1',
      () {
    final list = range(4, downTo: 1);
    expect(list, [4, 3, 2, 1]);
  });

  test('Creates a list starting at 1 and counts up to 8 with a increment of 2',
      () {
    final list = range(1, to: 8, step: 2);
    expect(list, [1, 3, 5, 7]);
  });

  test('Creates a list starting at 0 and counts up to 8 with a increment of 2',
      () {
    final list = range(0, to: 8, step: 2);
    expect(list, [0, 2, 4, 6, 8]);
  });

  test(
      'Creates a list starting at 8 and counts down to 1 with a increment of 2',
      () {
    final list = range(8, downTo: 1, step: 2);
    expect(list, [8, 6, 4, 2]);
  });

  test('Creates a list starting at 1 and counts until 10 with a increment of 1',
      () {
    final list = range(1, until: 10);
    expect(list, [1, 2, 3, 4, 5, 6, 7, 8, 9]);
  });
}
