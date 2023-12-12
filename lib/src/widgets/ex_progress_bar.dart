import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

///   <img width="369" alt="image" src="https://user-images.githubusercontent.com/36602270/169626718-b998853b-1837-44e4-8f2a-1561619f1087.png">
class ExProgressBar extends StatelessWidget {
  const ExProgressBar({
    required this.value,
    required this.color1,
    required this.color2,
    super.key,
    this.height,
    this.radius,
  });

  final int value;
  final double? height;
  final Color color1;
  final Color color2;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    final rest = 100 - value;
    return Directionality(
      textDirection: TextDirection.ltr,
      child: MediaQuery(
        data: const MediaQueryData(),
        child: Stack(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 100,
                  child: Container(
                    height: height ?? 12,
                    color: color2,
                  ).cornerRadius(radius ?? 20),
                ),
              ],
            ),
            Row(
              children: [
                if (value != 0) ...[
                  Expanded(
                    flex: value,
                    child: Container(
                      width: 200,
                      height: height ?? 12,
                      color: color1,
                    ).cornerRadius(radius ?? 20),
                  ),
                ],
                Expanded(
                  flex: rest,
                  child: Container(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
