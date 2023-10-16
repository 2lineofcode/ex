import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExCloseButton extends StatelessWidget {
  const ExCloseButton({super.key, this.color, this.onPressed, this.icon});

  final Color? color;
  final VoidCallback? onPressed;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed ?? Get.back,
      icon: Icon(icon ?? Icons.close, color: color),
    );
  }
}
