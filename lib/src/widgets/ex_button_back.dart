import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExBackButton extends StatelessWidget {
  const ExBackButton({super.key, this.color, this.onPressed});

  final Color? color;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed ?? Get.back,
      icon: Icon(Icons.arrow_back, color: color),
    );
  }
}
