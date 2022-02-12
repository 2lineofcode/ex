import 'package:ex/src/core/text.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Should chunk a list into chunks of strings with a length of 4', () {
    const list = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    final chunkedList = list.chunked(4);

    expect(chunkedList.length, 7);
    expect(chunkedList.elementAt(0), 'ABCD');
    expect(chunkedList.elementAt(1), 'EFGH');
    expect(chunkedList.elementAt(2), 'IJKL');
    expect(chunkedList.elementAt(3), 'MNOP');
    expect(chunkedList.elementAt(4), 'QRST');
    expect(chunkedList.elementAt(5), 'UVWX');
    expect(chunkedList.elementAt(6), 'YZ');
  });

  test(
      'Should chunk a list into chunks of strings with a length of 4 and transform the chunked strings',
      () {
    const list = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    final chunkedList = list.chunked(4, (chunk) => chunk.length);

    expect(chunkedList.length, 7);
    expect(chunkedList.elementAt(0), 4);
    expect(chunkedList.elementAt(1), 4);
    expect(chunkedList.elementAt(2), 4);
    expect(chunkedList.elementAt(3), 4);
    expect(chunkedList.elementAt(4), 4);
    expect(chunkedList.elementAt(5), 4);
    expect(chunkedList.elementAt(6), 2);
  });
}
