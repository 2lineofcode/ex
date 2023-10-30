import 'package:ex_kit/ex.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ColorExt', () {
    test('isHexColor should correctly validate hex colors', () {
      expect('#FFFFFF'.isHexColor, isTrue); // Valid 6-digit hex color
      expect('#ff0000'.isHexColor, isTrue); // Valid 6-digit hex color
      expect('#12345678'.isHexColor, isTrue); // Valid 8-digit hex color
      expect('#abc'.isHexColor, isTrue); // Valid 3-digit hex color
      expect('#12z'.isHexColor, isFalse); // Invalid hex color with a non-hex character
      expect('red'.isHexColor, isFalse); // Invalid non-hex color string
    });

    test('toColor should correctly convert hex strings to Color objects', () {
      expect('#FF0000'.toColor, equals(Colors.red)); // Red color
      expect('#00FF00'.toColor, equals(Colors.green)); // Green color
      expect('#0000FF'.toColor, equals(Colors.blue)); // Blue color
      expect('#12345678'.toColor, equals(Color(0x12345678))); // Custom 8-digit hex color
      expect('#abc'.toColor, equals(Color(0xFFAABBCC))); // Custom 3-digit hex color
      expect('#12z'.toColor, isNull); // Invalid hex color with a non-hex character
      expect('red'.toColor, isNull); // Invalid non-hex color string
    });
  });
}
