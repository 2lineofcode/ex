import 'package:ex/src/core/control_flow.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Should run the block code and return the context', () {
    final value = 5;
    var ranAlso = false;

    final returnedValue = value.also((it) {
      ranAlso = true;
    });

    expect(value, returnedValue);
    expect(ranAlso, true);
  });
}
