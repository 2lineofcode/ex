import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../ex.dart';

///   created               : Aditya Pratama
///   originalFilename      : ex_button_default
///   date                  : 24 Jun 2021
///   —————————————————————————————————————————————————————————————————————————————
///   screenshot            : https://prnt.sc/16i0dic

class ExButtonDefault extends StatelessWidget {
  const ExButtonDefault({
    Key? key,
    required this.btnText,
    this.onPress,
    this.width,
    this.height,
    this.bgColor,
    this.textColor,
    this.textSize,
    this.isTextBold = false,
    this.radius,
    this.icon,
    this.withBadge = false,
    this.badgeCount,
    this.badgeColor = Colors.red,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String btnText;
  final Color? bgColor;
  final Color? textColor;
  final VoidCallback? onPress;
  final double? textSize;
  final double? radius;
  final IconData? icon;
  final bool? isTextBold;
  final bool? withBadge;
  final int? badgeCount;
  final Color? badgeColor;

  @override
  Widget build(BuildContext context) {
    var badgeCountForPrint = badgeCount;
    if (badgeCount != null && badgeCount! >= 99) {
      badgeCountForPrint = 99;
    }

    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPress ?? () {},
        style: ElevatedButton.styleFrom(
          primary: bgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? 4),
          ),
        ),
        child: HStack(
          [
            if (icon != null)
              HStack([
                Icon(icon),
                8.widthBox,
              ]),
            btnText.text
                .textStyle(TextStyle(
                  color: textColor,
                  fontWeight: isTextBold == true ? FontWeight.w900 : FontWeight.normal,
                ))
                .size(textSize ?? 15)
                .make(),
            if (withBadge == true && badgeCountForPrint != 0)
              HStack([
                8.widthBox,
                Container(
                  height: 20,
                  width: 28,
                  color: badgeColor,
                  child: '${badgeCountForPrint.toString().first(n: 2)}'.text.size(12).maxLines(1).align(TextAlign.center).makeCentered(),
                ).cornerRadius(90),
              ]),
          ],
        ),
      ),
    );
  }
}
