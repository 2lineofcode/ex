import 'package:flutter_test/flutter_test.dart';
import 'package:ex/src/core/collections.dart';

void main() {
  test('index is provided to the mapping function', () {
    final list = ['a', 'b', 'c'];
    final mapped = list.mapIndexed((idx, el) => '$idx$el');
    expect(mapped, ['0a', '1b', '2c']);
  });
}
