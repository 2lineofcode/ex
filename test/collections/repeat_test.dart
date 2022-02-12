import 'package:ex/src/core/collections.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Should do nothing if iterations is zero', () {
    var executed = false;
    repeat(0, (_) => executed = true);
    expect(executed, false);
  });

  test('Should repeat a simple operation', () {
    var counter = 0;
    repeat(5, (_) => counter++);
    expect(counter, 5);
  });

  test('Should allow using the index on each iteration', () {
    final calls = <int>[];
    repeat(3, calls.add);
    expect(calls, [0, 1, 2]);
  });

  test('Should return the mapped list of results (if any)', () {
    final evens = repeat(10, (e) => 2 * e);
    expect(evens, [0, 2, 4, 6, 8, 10, 12, 14, 16, 18]);
  });
}
