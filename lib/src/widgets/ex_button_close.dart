import 'package:flutter/material.dart';

class ExCloseButton extends StatelessWidget {
  const ExCloseButton({super.key, this.color, this.onPressed});

  final Color? color;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return CloseButton(
      color: color,
      onPressed: onPressed,
    );
  }
}
