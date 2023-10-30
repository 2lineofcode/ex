import 'package:flutter/material.dart';

class ExCloseButton extends StatelessWidget {
  const ExCloseButton({super.key, this.color, this.onPressed, this.icon});

  final Color? color;
  final VoidCallback? onPressed;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed ?? () => Navigator.pop(context),
      icon: Icon(icon ?? Icons.close, color: color),
    );
  }
}
