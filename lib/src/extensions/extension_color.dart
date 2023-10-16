import 'package:flutter/material.dart';

extension ColorExt on String {
  bool get isHexColor => RegExp(r'^#?(?:[0-9a-fA-F]{3,4}){1,2}$').hasMatch(this);

  Color? get toColor {
    if (isHexColor) {
      final buffer = StringBuffer();
      if (length == 6 || length == 7) buffer.write('FF');
      buffer.write(replaceFirst('#', ''));
      return Color(int.parse(buffer.toString(), radix: 16));
    }
    return null;
  }
}
