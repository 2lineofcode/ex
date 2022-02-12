import 'package:ex/ex.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Should return the correct value in the simplested form', () {
    int willSucceed() => 1;

    final value = tryy(() {
      return willSucceed();
    });

    expect(value, 1);
  });

  test('Should call the onCatch if error was thrown', () {
    int willThrownAnException() => throw Exception('Failed');

    final value = tryy(() {
      return willThrownAnException();
    }, catches: [
      On<Exception>((err) {
        return 1;
      }),
    ]);

    expect(value, 1);
  });
}
