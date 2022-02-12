import 'package:ex/src/core/text.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('groupingBy', () {
    const words = 'one two three four five six seven eight nine ten';
    final grouping = words.groupingBy((value) => value[0]);

    expect(grouping.group, {
      'o': ['o', 'o', 'o'],
      'n': ['n', 'n', 'n', 'n', 'n'],
      'e': ['e', 'e', 'e', 'e', 'e', 'e', 'e', 'e', 'e'],
      ' ': [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
      't': ['t', 't', 't', 't'],
      'w': ['w'],
      'h': ['h', 'h'],
      'r': ['r', 'r'],
      'f': ['f', 'f'],
      'u': ['u'],
      'i': ['i', 'i', 'i', 'i'],
      'v': ['v', 'v'],
      's': ['s', 's'],
      'x': ['x'],
      'g': ['g']
    });
  });
}
