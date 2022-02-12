import 'package:flutter_test/flutter_test.dart';
import 'package:ex/src/core/collections.dart';

void main() {
  test('Should return single or null when no test lambda is provided', () {
    final list1 = [1, 2, 3];
    expect(list1.singleOrNull(), null);

    final list2 = [10];
    expect(list2.singleOrNull(), 10);

    final list3 = [];
    expect(list3.singleOrNull(), null);
  });
  test('Should return single or null when test lambda is provided', () {
    final list1 = [1, 2, 3];
    expect(list1.singleOrNull((e) => e.isEven), 2);

    final list2 = [10, 0];
    expect(list2.singleOrNull((e) => e.isOdd), null);
    expect(list2.singleOrNull((e) => e.isEven), null);

    final list3 = <int>[];
    expect(list3.singleOrNull((e) => e.isEven), null);

    final list4 = [1, 3, 5, 2, 7, 10, 20];
    expect(list4.singleOrNull((e) => e.isOdd), null);
    expect(list4.singleOrNull((e) => e.isEven), null);
    expect(list4.singleOrNull((e) => e.isEven && e.isOdd), null);
    expect(list4.singleOrNull((e) => e == 10), 10);
  });
}
