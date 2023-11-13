import 'package:flutter/material.dart';

import '../../ex.dart';

///   created               : Aditya Pratama
///   originalFilename      : ex_ui_error
///   date                  : 24 Jun 2021
///   —————————————————————————————————————————————————————————————————————————————
///   <img width="156" alt="image" src="https://user-images.githubusercontent.com/36602270/169626815-4a6e631d-4ac6-4430-b2eb-5538ae12ac80.png">

class ExUiErrorOrEmpty extends StatelessWidget {
  const ExUiErrorOrEmpty({
    super.key,
    this.title,
    this.titleStyle,
    this.message,
    this.messageStyle,
    this.bgColor,
    this.illustration,
    this.child,
  });

  final Widget? illustration;
  final String? title;
  final TextStyle? titleStyle;
  final String? message;
  final TextStyle? messageStyle;
  final Color? bgColor;

  /// if child is not null, ignore all other parameters
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgColor ?? Colors.transparent,
      child: VStack(
        [
          if (child != null) ...[
            child!,
          ] else ...[
            if (illustration != null) illustration!.centered(),
            if (title != null) title!.text.bold.size(16).textStyle(titleStyle).align(TextAlign.center).makeCentered().pSymmetric(v: 12),
            if (message != null) message!.text.size(12).align(TextAlign.center).textStyle(messageStyle).makeCentered(),
          ],
        ],
      ).centered(),
    );
  }
}
