import 'package:flutter_test/flutter_test.dart';
import 'package:ex/src/core/collections.dart';

void main() {
  test('Should work with non null list with non null elements', () {
    final list = [1, 2, 3];
    final filtered = list.filterNotNull();
    expect(filtered.map((e) => e + 1), [2, 3, 4]);
  });

  test('Should work with null list with non null elements', () {
    final list = <int?>[1, 2, 3];
    final filtered = list.filterNotNull();
    expect(filtered.map((e) => e + 1), [2, 3, 4]);
  });

  test('Should work with null list with null elements', () {
    final list = [1, null, 2, 3, null];
    final filtered = list.filterNotNull();
    expect(filtered.map((e) => e + 1), [2, 3, 4]);
  });
}
