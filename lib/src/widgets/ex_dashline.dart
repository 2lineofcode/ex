import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

///   <img width="203" alt="image" src="https://user-images.githubusercontent.com/36602270/169626674-686f0938-7cd9-4694-b1de-40b7cf33e9a4.png">
class ExDashLine extends StatelessWidget {
  const ExDashLine({
    super.key,
    this.width,
    this.color,
  });

  final double? width;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return VStack([
      Container(
        width: width ?? 50,
        height: 3,
        color: color ?? Colors.grey[400],
      ).cornerRadius(8).centered(),
    ]);
  }
}
