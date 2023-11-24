import 'package:ex/src/extensions/extension_collection.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('List Extensions', () {
    test('Random element', () {
      final myList = [1, 2, 3, 4, 5];
      final randomElement = myList.random;
      expect(myList.contains(randomElement), isTrue);
    });

    test('If empty', () {
      final myList = [1, 2, 3, 4, 5];
      final emptyList = <int>[];
      expect(myList.ifEmpty(emptyList), equals(myList));
      expect(emptyList.ifEmpty(myList), equals(myList));
    });

    test('Move element', () {
      final myList = [1, 2, 3, 4, 5];
      const elementToMove = 3;
      myList.move(elementToMove, 1);
      expect(myList, equals([1, 3, 2, 4, 5]));
    });

    test('Split', () {
      final myList = [1, 2, 3, 4, 5, 6, 7, 8, 9];
      final chunks = myList.split(3).toList();
      expect(
        chunks,
        equals(
          [
            [1, 2, 3],
            [4, 5, 6],
            [7, 8, 9],
          ],
        ),
      );
    });
  });

  group('Set Extensions', () {
    test('If empty', () {
      final mySet = {1, 2, 3, 4, 5};
      final emptySet = <int>{};
      expect(mySet.ifEmpty(emptySet), equals(mySet));
      expect(emptySet.ifEmpty(mySet), equals(mySet));
    });
  });

  group('Iterable Extensions', () {
    test('Has one', () {
      final singleElement = [1];
      final multipleElements = [1, 2, 3];
      expect(singleElement.hasOne, isTrue);
      expect(multipleElements.hasOne, isFalse);
    });

    test('Is length even', () {
      final evenLength = [1, 2, 3, 4];
      final oddLength = [1, 2, 3];
      expect(evenLength.isLengthEven, isTrue);
      expect(oddLength.isLengthEven, isFalse);
    });

    test('Is length odd', () {
      final evenLength = [1, 2, 3, 4];
      final oddLength = [1, 2, 3];
      expect(evenLength.isLengthOdd, isFalse);
      expect(oddLength.isLengthOdd, isTrue);
    });

    test('If empty', () {
      final myList = [1, 2, 3, 4, 5];
      final emptyList = <int>[];
      expect(myList.ifEmpty(emptyList), equals(myList));
      expect(emptyList.ifEmpty(myList), equals(myList));
    });
  });
}
