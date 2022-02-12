import 'package:flutter_test/flutter_test.dart';
import 'package:ex/src/core/collections.dart';

void main() {
  test('Should chunk any list into chunks of 3', () {
    final list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    final chunkedList = list.chunked(3);

    expect(chunkedList.length, 4);
    expect(chunkedList.elementAt(0), [1, 2, 3]);
    expect(chunkedList.elementAt(1), [4, 5, 6]);
    expect(chunkedList.elementAt(2), [7, 8, 9]);
    expect(chunkedList.elementAt(3), [10]);
  });

  test('Should chunk any list into chunks of 3 and transform the chunks', () {
    final list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    final chunkedList = list.chunked(3, (chunk) => chunk.reversed);

    expect(chunkedList.length, 4);
    expect(chunkedList.elementAt(0), [3, 2, 1]);
    expect(chunkedList.elementAt(1), [6, 5, 4]);
    expect(chunkedList.elementAt(2), [9, 8, 7]);
    expect(chunkedList.elementAt(3), [10]);
  });
}
