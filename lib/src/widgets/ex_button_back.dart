import 'package:flutter/material.dart';

class ExBackButton extends StatelessWidget {
  const ExBackButton({
    super.key,
    this.icon,
    this.color,
    this.onPressed,
  });

  final Color? color;
  final VoidCallback? onPressed;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed ?? () => Navigator.pop(context),
      icon: Icon(icon ?? Icons.arrow_back, color: color),
    );
  }
}
