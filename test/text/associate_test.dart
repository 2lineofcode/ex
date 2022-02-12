import 'package:ex/src/core/text.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('associate', () {
    const string = 'bonne journée';
    final result = string.associate((char) => Pair(char, char.codeUnitAt(0)));

    expect(result, {
      'b': 98,
      'o': 111,
      'n': 110,
      'e': 101,
      ' ': 32,
      'j': 106,
      'u': 117,
      'r': 114,
      'é': 233
    });
  });

  test('associateBy', () {
    const string = 'bonne journée';
    final result = string.associateBy((char) => char.codeUnitAt(0));

    expect(result, {
      98: 'b',
      111: 'o',
      110: 'n',
      101: 'e',
      32: ' ',
      106: 'j',
      117: 'u',
      114: 'r',
      233: 'é'
    });
  });
}
