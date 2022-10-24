import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../ex.dart';

///   created               : Aditya Pratama
///   originalFilename      : ex_ui_error
///   date                  : 24 Jun 2021
///   —————————————————————————————————————————————————————————————————————————————
///   <img width="156" alt="image" src="https://user-images.githubusercontent.com/36602270/169626815-4a6e631d-4ac6-4430-b2eb-5538ae12ac80.png">

class ExUiErrorOrEmpty extends StatelessWidget {
  const ExUiErrorOrEmpty({
    Key? key,
    this.message,
    this.callback,
    this.title = '',
    this.bgColor,
    this.textColor,
    this.btnText,
    this.illustration,
    this.showBtnRetry = false,
    this.textSize = 14,
  }) : super(key: key);

  final String? message;
  final String? title;
  final double? textSize;
  final String? btnText;
  final bool? showBtnRetry;
  final Color? bgColor;
  final Color? textColor;
  final Function? callback;
  final Widget? illustration;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Container(
        color: bgColor ?? Colors.transparent,
        child: VStack(
          [
            if (illustration != null) illustration!.centered() else SvgPicture.asset('assets/images/ic_dialog_error2.svg').centered(),
            if (!title.isEmptyOrNull) '$title'.text.size(16).semiBold.color(Colors.black).center.makeCentered().pSymmetric(v: 12).pOnly(top: 12),
            if (!message.isEmptyOrNull) '$message'.text.size(textSize).color(textColor ?? Color(0xFF676E76)).align(TextAlign.center).makeCentered(),
            if (showBtnRetry == true)
              ExButtonOutline(
                label: btnText ?? 'Reload',
                labelColor: textColor ?? Colors.black,
                onPressed: () => callback ?? () {},
              ).centered().pSymmetric(v: 12),
          ],
        ).centered(),
      ),
    );
  }
}
