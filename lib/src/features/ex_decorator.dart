import 'package:flutter/material.dart';

mixin ExDecorator {
  static BoxDecoration boxBottomSheetRadiusDecoration({double radius = 16}) {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(radius),
        topRight: Radius.circular(radius),
      ),
    );
  }

  static BoxDecoration commonBoxDecoration({
    Color? borderColor = const Color(0xFFD8DCE0),
    Color? fillColor = Colors.transparent,
    double borderRadius = 4,
  }) {
    return BoxDecoration(
      color: fillColor,
      border: Border.all(color: borderColor ?? const Color(0xFFD8DCE0)),
      borderRadius: BorderRadius.circular(borderRadius),
    );
  }

  static BoxDecoration commonBoxDecorationWithShadow({
    Color? borderColor = const Color(0xFFD8DCE0),
    Color? fillColor = Colors.white,
    double borderRadius = 0.0,
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
}
