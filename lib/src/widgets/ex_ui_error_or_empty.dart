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
    this.message,
    this.action,
    this.bgColor,
    this.illustration,
  });

  final Widget? title;
  final Widget? message;
  final Widget? action;
  final Color? bgColor;
  final Widget? illustration;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Container(
        color: bgColor ?? Colors.transparent,
        child: VStack(
          [
            if (illustration != null) illustration!.centered().pOnly(bottom: 12),
            if (title != null) title!.pSymmetric(v: 12),
            if (message != null) message!.pSymmetric(v: 12),
            if (action != null) action!.pSymmetric(v: 12),
          ],
        ).centered(),
      ),
    );
  }
}
