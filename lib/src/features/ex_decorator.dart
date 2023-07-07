import 'package:flutter/material.dart';

mixin ExDecorator {
  static BoxDecoration box({
    Color? borderColor = const Color(0xFFD8DCE0),
    Color? fillColor = Colors.white,
    double borderRadius = 12,
  }) {
    return BoxDecoration(
      color: fillColor,
      border: Border.all(color: borderColor ?? const Color(0xFFD8DCE0)),
      borderRadius: BorderRadius.circular(borderRadius),
    );
  }

  static BoxDecoration boxShadow({
    Color? borderColor = const Color(0xFFD8DCE0),
    Color? fillColor = Colors.white,
    double borderRadius = 12,
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

  static BoxDecoration boxBottomSheet({double radius = 24}) {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(radius),
        topRight: Radius.circular(radius),
      ),
    );
  }
}
