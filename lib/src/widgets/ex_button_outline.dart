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
    Key? key,
    this.width,
    this.height = 44,
    this.label = 'ExButton',
    this.onPressed,
    this.labelColor,
    this.borderColor,
    this.radius = 4,
    this.labelSize = 14,
    this.backgroundColor,
    this.leftIcon,
    this.rightIcon,
    this.isLabelBold = false,
    this.isShowBadge = false,
    this.badgeTextCount,
    this.badgeColor = Colors.red,
    this.isEnable = true,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String? label;
  final VoidCallback? onPressed;
  final Color? labelColor;
  final Color? borderColor;
  final Color? backgroundColor;
  final double radius;
  final double? labelSize;
  final Widget? leftIcon;
  final Widget? rightIcon;
  final bool? isLabelBold;
  final bool? isShowBadge;
  final int? badgeTextCount;
  final Color? badgeColor;
  final bool? isEnable;

  @override
  Widget build(BuildContext context) {
    var badgeCountForPrint = badgeTextCount;
    if (badgeTextCount != null && badgeTextCount! >= 99) {
      badgeCountForPrint = 99;
    }

    if (isEnable == true) {
      return OutlinedButton(
        onPressed: onPressed ?? () {},
        style: OutlinedButton.styleFrom(
          primary: labelColor,
          backgroundColor: backgroundColor,
          side: BorderSide(color: borderColor ?? Colors.grey),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
          minimumSize: Size(width ?? 44, height ?? 44),
        ),
        child: HStack([
          if (leftIcon != null) HStack([leftIcon!, 8.widthBox]),
          Text(
            '$label',
            style: TextStyle(
              color: labelColor,
              fontWeight: isLabelBold == true ? FontWeight.w700 : FontWeight.normal,
              fontSize: labelSize,
            ),
            overflow: TextOverflow.ellipsis,
          ),
          if (isShowBadge == true && badgeCountForPrint != 0)
            HStack([
              8.widthBox,
              Container(
                height: 20,
                width: 28,
                color: badgeColor,
                child: '${badgeCountForPrint.toString().first(n: 2)}'.text.color(Colors.white).size(12).maxLines(1).align(TextAlign.center).makeCentered(),
              ).cornerRadius(90),
            ]),
          if (rightIcon != null) rightIcon!,
        ]),
      );
    } else {
      return OutlinedButton(
        onPressed: null,
        style: OutlinedButton.styleFrom(
          primary: labelColor,
          backgroundColor: backgroundColor,
          side: BorderSide(color: borderColor ?? Color(0xFFD8DCE0)),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
          minimumSize: Size(width ?? 44, height ?? 44),
        ),
        child: HStack([
          if (leftIcon != null) HStack([leftIcon!, 8.widthBox]),
          Text(
            '$label',
            style: TextStyle(
              color: labelColor,
              fontWeight: isLabelBold == true ? FontWeight.w700 : FontWeight.normal,
              fontSize: labelSize,
            ),
            overflow: TextOverflow.ellipsis,
          ),
          if (isShowBadge == true && badgeCountForPrint != 0)
            HStack([
              8.widthBox,
              Container(
                height: 20,
                width: 28,
                color: badgeColor,
                child: '${badgeCountForPrint.toString().first(n: 2)}'.text.color(Colors.white).size(12).maxLines(1).align(TextAlign.center).makeCentered(),
              ).cornerRadius(90),
            ]),
        ]),
      );
    }
  }
}
