import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';


///   created               : Aditya Pratama
///   originalFilename      : ex_dashline
///   date                  : 24 Jun 2021
///   —————————————————————————————————————————————————————————————————————————————
///   screenshot           : https://prnt.sc/16i0134

class ExDashLine extends StatelessWidget {
  const ExDashLine({
    Key? key,
    this.width,
    this.color,
  }) : super(key: key);

  final double? width;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return VStack([
      Container(
        width: width ?? 50,
        height: 3,
        color: color ?? Colors.grey[400],
      ).cornerRadius(8) .centered(),
    ]);
  }
}
