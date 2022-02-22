import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

///   created               : Aditya Pratama
///   originalFilename      : ex_progress
///   date                  : 24 Jun 2021
///   —————————————————————————————————————————————————————————————————————————————
///   screenshot            : https://prnt.sc/16i0qk5

class ExProgressIndicator extends StatelessWidget {
  const ExProgressIndicator({
    Key? key,
    required this.value,
    this.height = 12,
    this.color1,
    this.color2,
    this.radius = 20,
    this.labelText,
    this.labelStyle = const TextStyle(),
    this.showPercentage = true,
  }) : super(key: key);

  final int value;
  final double? height;
  final Color? color1;
  final Color? color2;
  final double? radius;
  final String? labelText;
  final TextStyle? labelStyle;
  final bool? showPercentage;

  @override
  Widget build(BuildContext context) {
    final int rest = 100 - value;
    return Directionality(
      textDirection: TextDirection.ltr,
      child: MediaQuery(
        data: MediaQueryData(),
        child: SizedBox(
          child: HStack([
            VStack([
              if (labelText != null && labelText!.isNotEmpty)
                VStack([
                  '$labelText'.text.textStyle(labelStyle!).make(),
                  8.heightBox,
                ]),
              ZStack(
                [
                  HStack([
                    Expanded(
                      flex: 100,
                      child: Container(
                        height: height,
                        color: color2 ?? Theme.of(context).primaryColorLight,
                      ).cornerRadius(radius!),
                    ),
                  ]),
                  HStack([
                    Expanded(
                      flex: value,
                      child: Container(
                        width: 200,
                        height: height,
                        color: color1 ?? Theme.of(context).primaryColor,
                      ).cornerRadius(radius!),
                    ),
                    Expanded(
                      flex: rest,
                      child: Container(),
                    ),
                  ]),
                ],
              ),
            ]).expand(),
            if (showPercentage == true)
              HStack([
                12.widthBox,
                '$value%'.text.makeCentered(),
              ]).centered(),
          ]),
        ),
      ),
    );
  }
}
