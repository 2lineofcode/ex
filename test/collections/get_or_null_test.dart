import 'package:flutter_test/flutter_test.dart';
import 'package:ex/src/core/collections.dart';

void main() {
  test('Should return element or null for non-empty lists', () {
    final list = [1, 2, 3];
    expect(list.getOrNull(0), 1);
    expect(list.getOrNull(1), 2);
    expect(list.getOrNull(2), 3);

    expect(list.getOrNull(-10), null);
    expect(list.getOrNull(-1), null);
    expect(list.getOrNull(3), null);
    expect(list.getOrNull(500), null);
  });
  test('Should always return null for an empty list', () {
    final list = [];
    for (var i in range(-10, to: 10)) {
      expect(list.getOrNull(i), null);
    }
  });
}
