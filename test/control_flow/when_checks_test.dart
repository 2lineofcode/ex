import 'package:ex/ex.dart';
import 'package:flutter_test/flutter_test.dart' show test, expect, group;

void main() {
  group('isIn', () {
    test('', () {
      expect(isIn([1, 2, 3])(1), true);
      expect(isIn([1, 2, 3])(3), true);
      expect(isIn([1, 2, 3])(4), false);
    });
  });

  group('isNotIn', () {
    test('', () {
      expect(isNotIn([1, 2, 3])(1), false);
      expect(isNotIn([1, 2, 3])(3), false);
      expect(isNotIn([1, 2, 3])(4), true);
    });
  });

  group('isType', () {
    test('', () {
      expect(isType<String>()('string'), true);
      expect(isType<int>()(1), true);
      expect(isType<List>()([]), true);
      expect(isType<List>()(1), false);
      expect(isType<String>()({}), false);
    });
  });

  group('isNotType', () {
    test('', () {
      expect(isNotType<String>()(1), true);
      expect(isNotType<int>()('string'), true);
      expect(isNotType<List>()({}), true);
      expect(isNotType<List>()([]), false);
      expect(isNotType<String>()('string'), false);
    });
  });
}
