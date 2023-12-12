import 'package:flutter/material.dart';

///   —————————————————————————————————————————————————————————————————————————————
///   general object Key Value. use example:
///   - bottom sheet dialog
///   - list dialog
///   - etc.
///
class ExKeyValue {
  ExKeyValue({
    required this.key,
    required this.value,
    this.icon,
    this.isSelected,
  });

  dynamic key;
  String value;
  Widget? icon;
  bool? isSelected;
}
