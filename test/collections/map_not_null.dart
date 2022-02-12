import 'package:flutter_test/flutter_test.dart';
import 'package:ex/ex.dart';

void main() {
  test('Should work with non null list with non null elements', () {
    final list = [1, 2, 3];
    final mapped = list.mapNotNull((e) => e + 1);
    expect(mapped.map((e) => e + 1), [3, 4, 5]);
  });

  test('Should work with null list with non null elements', () {
    final list = <int?>[1, 2, 3];
    final mapped = list.mapNotNull((e) => e?.let((it) => it + 1));
    expect(mapped.map((e) => e + 1), [3, 4, 5]);
  });

  test('Should work with null list with null elements', () {
    final list = [1, null, 2, 3, null];
    final mapped = list.mapNotNull((e) => e?.let((it) => it + 1));
    expect(mapped.map((e) => e + 1), [2, 3, 4]);
  });

  test('Should map and filter out elements at the same time', () {
    final list = [1, null, 2, 3, null];
    final mapped = list.mapNotNull((e) => e?.isEven == true ? e : null);
    expect(mapped.map((e) => e + 0), [2]);
  });
}
