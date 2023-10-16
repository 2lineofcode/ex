// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import '../../ex.dart';

///   created               : Aditya Pratama
///   originalFilename      : ex_button_outline
///   date                  : 24 Jun 2021
///   —————————————————————————————————————————————————————————————————————————————
///   <img width="199" alt="image" src="https://user-images.githubusercontent.com/36602270/169626629-60056c7a-2081-4cb5-95a3-b88db7d00492.png">

class ExButtonOutline extends StatelessWidget {
  const ExButtonOutline({
    super.key,
    this.width,
    this.height = 44,
    this.label = '',
    this.onPressed,
    this.labelColor,
    this.borderColor,
    this.radius = 90,
    this.labelSize,
    this.backgroundColor,
    this.isLabelBold = true,
    this.child,
    this.icon,
  });

  final double? width;
  final double? height;
  final VoidCallback? onPressed;
  final String? label;
  final Color? labelColor;
  final double? labelSize;
  final bool? isLabelBold;
  final Color? borderColor;
  final Color? backgroundColor;
  final double radius;
  final Widget? child;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        primary: Colors.black87,
        backgroundColor: backgroundColor,
        side: BorderSide(color: borderColor ?? Vx.neutral300),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
        minimumSize: Size(width ?? 44, height ?? 44),
      ),
      child: child ??
          HStack([
            icon?.pOnly(right: 8) ?? 0.heightBox,
            Text(
              '$label',
              style: TextStyle(
                color: labelColor,
                fontWeight: isLabelBold == true ? FontWeight.w700 : FontWeight.w500,
                fontSize: labelSize,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ]),
    );
  }
}
