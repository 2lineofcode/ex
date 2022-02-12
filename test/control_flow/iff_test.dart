import 'package:ex/ex.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Should return the correct value in the simplested form', () {
    String? testIff(int value) {
      return iff(value == 1, () {
        return '1';
      }).orElse(() {
        return 'else';
      });
    }

    expect(testIff(1), '1');
    expect(testIff(2), 'else');
  });

  test('Should return the correct value with a single elseIf branch', () {
    String? testIff(int value) {
      return iff(value == 1, () {
        return '1';
      }).elseIf(value == 2, () {
        return '2';
      }).orElse(() {
        return 'else';
      });
    }

    expect(testIff(1), '1');
    expect(testIff(2), '2');
    expect(testIff(3), 'else');
  });

  test('Should support multiple elseIf branches', () {
    String? testIff(int value) {
      return iff(value == 1, () {
        return '1';
      }).elseIf(value == 2, () {
        return '2';
      }).elseIf(value == 3, () {
        return '3';
      }).orElse(() {
        return 'else';
      });
    }

    expect(testIff(1), '1');
    expect(testIff(2), '2');
    expect(testIff(3), '3');
    expect(testIff(4), 'else');
  });
}
