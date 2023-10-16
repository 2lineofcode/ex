import 'package:ex/src/extensions/extension_number.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Int Extension Helper', () {
    test('forEach', () {
      var sum = 0;
      5.forEach((index) {
        sum += index;
      });
      expect(sum, equals(10));
    });

    test('repeat', () {
      var sum = 0;
      3.repeat((index) {
        sum += index;
      });
      expect(sum, equals(3));
    });

    test('map', () {
      final mappedList = 4.map((index) {
        return index * 2;
      });
      expect(mappedList, equals([0, 2, 4, 6]));
    });
  });

  group('Num Extensions', () {
    test('isPositive', () {
      expect(5.isPositive, isTrue);
      expect((-5).isPositive, isFalse);
      expect(0.isPositive, isFalse);
    });

    test('isNegative', () {
      expect(5.isNegative, isFalse);
      expect((-5).isNegative, isTrue);
      expect(0.isNegative, isFalse);
    });

    test('isZero', () {
      expect(5.isZero, isFalse);
      expect((-5).isZero, isFalse);
      expect(0.isZero, isTrue);
    });

    test('half', () {
      expect(6.half, equals(3.0));
      expect((-8).half, equals(-4.0));
    });

    test('asGreeks', () {
      expect(500.asGreeks, equals('500'));
      expect(10000.asGreeks, equals('10.0K'));
      expect(2500000.asGreeks, equals('2.5M'));
      expect(3000000000.asGreeks, equals('3.0B'));
    });
  });
}
