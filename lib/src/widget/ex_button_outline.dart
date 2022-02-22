import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../ex.dart';

///   created               : Aditya Pratama
///   originalFilename      : ex_button_outline
///   date                  : 24 Jun 2021
///   —————————————————————————————————————————————————————————————————————————————
///   screenshot            : https://prnt.sc/16i0dic

class ExButtonOutline extends StatelessWidget {
  const ExButtonOutline({
    Key? key,
    this.width,
    this.height,
    this.btnText,
    this.onPress,
    this.color = Colors.black,
    this.radius,
    this.textSize,
    this.bgColor,
    this.icon,
    this.isTextBold,
    this.withBadge = false,
    this.badgeCount,
    this.badgeColor = Colors.red,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String? btnText;
  final VoidCallback? onPress;
  final Color? color;
  final Color? bgColor;
  final double? radius;
  final double? textSize;
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
      height: height,
      width: width,
      child: OutlinedButton(
        onPressed: onPress ?? () {},
        style: OutlinedButton.styleFrom(
            primary: color,
            backgroundColor: bgColor ?? Colors.transparent,
            side: BorderSide(color: color!),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius ?? 4),
            )),
        child: HStack(
          [
            if (icon != null)
              HStack([
                Icon(icon),
                8.widthBox,
              ]),
            (btnText ?? 'ExButton')
                .text
                .textStyle(TextStyle(
                  color: color,
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
                  child: '${badgeCountForPrint.toString().first(n: 2)}'.text.white.size(12).maxLines(1).align(TextAlign.center).makeCentered(),
                ).cornerRadius(90),
              ]),
          ],
        ),
      ),
    );
  }
}
