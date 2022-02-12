import 'package:flutter_test/flutter_test.dart';
import 'package:ex/src/core/collections.dart';

void main() {
  test('associate', () {
    final charCodes = [72, 69, 76, 76, 79];
    final byCharCode = charCodes.associate(
      (code) => Pair(code, String.fromCharCode(code)),
    );

    expect(byCharCode, {72: 'H', 69: 'E', 76: 'L', 79: 'O'});
  });

  test('associateBy', () {
    final charCodes = [72, 69, 76, 76, 79];
    final byCharCode = charCodes.associateBy(
      (code) => String.fromCharCode(code),
    );

    expect(byCharCode, {'H': 72, 'E': 69, 'L': 76, 'O': 79});
  });

  test('associateWith', () {
    final charCodes = [72, 69, 76, 76, 79];
    final fromCharCode = charCodes.associateWith(
      (code) => String.fromCharCode(code),
    );

    expect(fromCharCode, {72: 'H', 69: 'E', 76: 'L', 79: 'O'});
  });
}
