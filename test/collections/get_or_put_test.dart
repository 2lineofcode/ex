import 'package:flutter_test/flutter_test.dart';
import 'package:ex/src/core/collections.dart';

void main() {
  group('getOrPut', () {
    test('Should work with non-null map', () {
      final map = <String, int>{};

      // make sure the return value is non-null by adding 1
      expect(map.getOrPut('x', (_) => 2) + 1, 3);
      // cached value is there!
      expect(map.getOrPut('x', (_) => 10) + 1, 3);
    });

    test('Should work with nullable map', () {
      final map = <String, int?>{};

      expect(map.getOrPut('x', (_) => 2), 2);
      // subsequent calls to getOrPut do not evaluate the default value
      // since the first getOrPut has already stored value 2 in the map
      expect(map.getOrPut('x', (_) => 3), 2);

      // however null value mapped to a key is treated the same as the missing value
      expect(map.getOrPut('y', (_) => null), null);
      // so in that case the default value is evaluated
      expect(map.getOrPut('y', (_) => 42), 42);
    });

    test('Should receive the key as the lambda parameter', () {
      final doubles = <int, int>{};

      expect(doubles.getOrPut(4, (key) => key * 2), 8);
      expect(doubles.getOrPut(5, (key) => key * 2), 10);

      // make sure values are stored
      expect(doubles.getOrPut(4, (key) => key * 100), 8);
      expect(doubles.getOrPut(5, (key) => key * 100), 10);

      // new value
      expect(doubles.getOrPut(1, (key) => key * 2), 2);
    });

    test('Should invoke lambda exactly once', () {
      final map = <int, int>{};
      var i = 0;
      final lambda = (_) => i++;

      expect(i, 0);
      map.getOrPut(0, lambda);
      expect(i, 1);
      map.getOrPut(0, lambda);
      expect(i, 1);

      // new value
      map.getOrPut(1, lambda);
      expect(i, 2);
    });
  });
}
