import 'dart:math' as mm;

extension IntExtensionHelper on int {
  void forEach(void Function(int index) f) {
    for (var i = 0; i < this; i++) {
      f(i);
    }
  }

  void repeat(void Function(int index) f) {
    for (var i = 0; i < this; i++) {
      f(i);
    }
  }

  List<T> map<T>(T Function(int index) f) {
    final values = <T>[];
    for (var i = 0; i < this; i++) {
      values.add(f(i));
    }
    return values;
  }
}

extension NumExtensions on num {
  bool get isPositive => this > 0;

  bool get isNegative => this < 0;

  bool get isZero => this == 0;

  double get half => this / 2;

  String get asGreeks {
    const greekSymbols = <String>['K', 'M', 'B', 'T', 'Q', 'P', 'E', 'Z', 'Y'];
    if (this < 1000) return toString();
    final magnitude = (toString().length - 1) ~/ 3;
    final scaledNumber = this / mm.pow(1000, magnitude);
    final symbol = greekSymbols[magnitude - 1];
    return scaledNumber.toStringAsFixed(1) + symbol;
  }
}
