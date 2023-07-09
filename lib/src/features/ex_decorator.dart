import 'package:flutter/material.dart';

mixin ExDecorator {
  static BoxDecoration box({
    Color? borderColor = const Color(0xFFD8DCE0),
    Color? fillColor = Colors.transparent,
    double borderRadius = 8,
    double? borderWidth = 1,
  }) {
    return BoxDecoration(
      color: fillColor,
      border: Border.all(color: borderColor ?? const Color(0xFFD8DCE0), width: borderWidth ?? 1),
      borderRadius: BorderRadius.circular(borderRadius),
    );
  }

  static BoxDecoration shadow({
    Color? borderColor = const Color(0xFFD8DCE0),
    Color? fillColor = Colors.white,
    double borderRadius = 8,
  }) {
    return BoxDecoration(
      color: fillColor,
      borderRadius: BorderRadius.circular(borderRadius),
      boxShadow: [
        BoxShadow(
          color: Colors.grey[200]!,
          spreadRadius: 10,
          blurRadius: 10,
          offset: const Offset(3, 3),
        ),
      ],
    );
  }

  static BoxDecoration top({double radius = 24}) {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(radius),
        topRight: Radius.circular(radius),
      ),
    );
  }

  static BoxDecoration custom({
    double? topLeft,
    double? topRight,
    double? bottomLeft,
    double? bottomRight,
  }) {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(topLeft ?? 0),
        topRight: Radius.circular(topRight ?? 0),
        bottomLeft: Radius.circular(bottomLeft ?? 0),
        bottomRight: Radius.circular(bottomRight ?? 0),
      ),
    );
  }
}
