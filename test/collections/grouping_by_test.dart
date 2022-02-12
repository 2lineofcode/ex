import 'package:flutter_test/flutter_test.dart';
import 'package:ex/src/core/collections.dart';

void main() {
  test('groupingBy', () {
    final words = 'one two three four five six seven eight nine ten'.split(' ');
    final grouping = words.groupingBy((value) => value[0]);

    expect(grouping.group, {
      'o': ['one'],
      't': ['two', 'three', 'ten'],
      'f': ['four', 'five'],
      's': ['six', 'seven'],
      'e': ['eight'],
      'n': ['nine']
    });
  });

  group('Grouping', () {
    test('Should return a Map-like string representation', () {
      final numbers = [3, 4, 5, 6, 7, 8, 9];
      final aggregated = numbers.groupingBy((value) => value % 3);

      expect(
        aggregated.toString(),
        {
          0: [3, 6, 9],
          1: [4, 7],
          2: [5, 8]
        }.toString(),
      );
    });

    test('Should return the group key when passed an element', () {
      final numbers = [3, 4, 5, 6, 7, 8, 9];
      final aggregated = numbers.groupingBy((value) => value % 3);

      expect(aggregated[3], 0);
      expect(aggregated[4], 1);
      expect(aggregated[5], 2);
      expect(aggregated[10], null);
    });

    test('Should aggregate by each element in each group', () {
      final numbers = [3, 4, 5, 6, 7, 8, 9];
      final aggregated = numbers
          .groupingBy((value) => value % 3)
          .aggregate((key, accumulator, element, first) {
        return first ? '$key:$element' : '$accumulator-$element';
      });

      expect(aggregated.keys.length, 3);
      expect(aggregated, {
        0: '0:3-6-9',
        1: '1:4-7',
        2: '2:5-8',
      });
    });

    test('Should aggregate into a given map by each element in each group', () {
      final numbers = [3, 4, 5, 6, 7, 8, 9];
      final aggregated = numbers
          .groupingBy((value) => value % 3)
          .aggregateTo({3: 'unknown'}, (key, accumulator, element, first) {
        return first ? '$key:$element' : '$accumulator-$element';
      });

      expect(aggregated.keys.length, 4);
      expect(aggregated, {0: '0:3-6-9', 1: '1:4-7', 2: '2:5-8', 3: 'unknown'});
    });

    test('Should count each group by the length of its elements', () {
      final numbers = [3, 4, 5, 6, 7, 8, 9];
      final aggregated = numbers.groupingBy((value) => value % 3).eachCount();

      expect(aggregated.keys.length, 3);
      expect(aggregated, {0: 3, 1: 2, 2: 2});
    });

    test(
        'Should count each group by the length of its elements into a given map',
        () {
      final numbers = [3, 4, 5, 6, 7, 8, 9];
      final aggregated =
          numbers.groupingBy((value) => value % 3).eachCountTo({3: 0});

      expect(aggregated.keys.length, 4);
      expect(aggregated, {0: 3, 1: 2, 2: 2, 3: 0});
    });
  });
}
