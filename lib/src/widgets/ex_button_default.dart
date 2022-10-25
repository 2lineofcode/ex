// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import '../../ex.dart';

///   created               : Aditya Pratama
///   originalFilename      : ex_button_default
///   date                  : 24 Jun 2021
///   —————————————————————————————————————————————————————————————————————————————
///   <img width="199" alt="image" src="https://user-images.githubusercontent.com/36602270/169626629-60056c7a-2081-4cb5-95a3-b88db7d00492.png">

class ExButtonDefault extends StatelessWidget {
  const ExButtonDefault({
    Key? key,
    this.label = '',
    this.onPressed,
    this.width,
    this.height = 45,
    this.backgroundColor,
    this.labelColor,
    this.labelSize = 16,
    this.isLabelBold = true,
    this.radius = 4,
    this.leftIcon,
    this.isShowBadge = false,
    this.badgeTextCount,
    this.badgeColor = Colors.red,
    this.isEnable = true,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String? label;
  final Color? backgroundColor;
  final Color? labelColor;
  final VoidCallback? onPressed;
  final double? labelSize;
  final double radius;
  final Widget? leftIcon;
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
      return ElevatedButton(
        onPressed: onPressed ?? () {},
        style: ElevatedButton.styleFrom(
          primary: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
          minimumSize: Size(width ?? 44, height ?? 44),
        ),
        child: HStack(
          [
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
          ],
        ),
      );
    } else {
      return ElevatedButton(
        onPressed: null,
        style: ElevatedButton.styleFrom(
          primary: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
          minimumSize: Size(width ?? 44, height ?? 44),
        ),
        child: HStack(
          [
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
          ],
        ),
      );
    }
  }
}
