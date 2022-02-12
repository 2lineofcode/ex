import 'package:flutter_test/flutter_test.dart';
import 'package:ex/src/core/collections.dart';

void main() {
  test('Should return first or null when no test lambda is provided', () {
    final list1 = [1, 2, 3];
    expect(list1.firstOrNull(), 1);

    final list2 = [10, 0];
    expect(list2.firstOrNull(), 10);

    final list3 = [];
    expect(list3.firstOrNull(), null);
  });

  test('Should return first or null when a test lambda is provided', () {
    final list1 = [1, 2, 3];
    expect(list1.firstOrNull((e) => e.isEven), 2);

    final list2 = [10, 0];
    expect(list2.firstOrNull((e) => e.isOdd), null);

    final list3 = <int>[];
    expect(list3.firstOrNull((e) => e.isEven), null);

    final list4 = [1, 3, 5, 2, 7, 10, 20];
    expect(list4.firstOrNull((e) => e.isOdd), 1);
    expect(list4.firstOrNull((e) => e.isEven), 2);
    expect(list4.firstOrNull((e) => e.isEven && e.isOdd), null);
  });
}
