import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin ExDecorator {
  static BoxDecoration box({
    Color? borderColor,
    Color? fillColor,
    double borderRadius = 8,
    double? borderWidth = 1,
  }) {
    return BoxDecoration(
      color: fillColor ?? Get.theme.cardColor,
      border: Border.all(
        color: borderColor ?? Get.theme.hintColor.withAlpha(100),
        width: borderWidth ?? 1,
      ),
      borderRadius: BorderRadius.circular(borderRadius),
    );
  }

  static BoxDecoration top({
    Color? fillColor,
    double radius = 16,
  }) {
    return BoxDecoration(
      color: fillColor ?? Get.theme.cardColor,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(radius),
        topRight: Radius.circular(radius),
      ),
    );
  }

  static BoxDecoration custom({
    Color? fillColor,
    double? topLeft,
    double? topRight,
    double? bottomLeft,
    double? bottomRight,
  }) {
    return BoxDecoration(
      color: fillColor ?? Get.theme.cardColor,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(topLeft ?? 0),
        topRight: Radius.circular(topRight ?? 0),
        bottomLeft: Radius.circular(bottomLeft ?? 0),
        bottomRight: Radius.circular(bottomRight ?? 0),
      ),
    );
  }
}
