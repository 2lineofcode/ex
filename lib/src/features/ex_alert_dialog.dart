// ignore_for_file: non_constant_identifier_names, deprecated_member_use
import 'package:flutter/material.dart';

import '../../ex.dart';

/*
 * ExAlert
 * Created by Aditya Pratama
 * https://adit.web.id
 *
 * Copyright (c) 2021 MDVK, LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */
mixin ExAlert {
  /// -- example implementation --
  /// ```dart
  /// ExAlert.success(
  ///   context: context,
  ///   title: 'Hello World',
  ///   message: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
  ///   onYes: () => print('clicked'),
  /// );
  /// ```

  static void success(
    BuildContext context, {
    Widget? icon,
    String? title,
    TextStyle? titleStyle,
    double titleTextSize = 18,
    TextAlign titleTextAlign = TextAlign.center,
    Color titleTextColor = Colors.black,
    String? message,
    TextStyle? messageStyle,
    double messageTextSize = 14,
    TextAlign messageTextAlign = TextAlign.center,
    Color messageTextColor = Vx.neutral500,
    bool isDismissible = true,
    String btnYesText = 'Close',
    Color color = const Color(0xFF229C80),
    double radius = 16,
    Function()? onYes,
  }) {
    _base(
      context,
      icon: icon ?? Icon(Icons.check_circle, size: 64, color: color).centered().pOnly(bottom: 16),
      title: title,
      titleStyle: titleStyle,
      titleTextSize: titleTextSize,
      titleTextAlign: titleTextAlign,
      titleTextColor: titleTextColor,
      message: message,
      messageStyle: messageStyle,
      messageTextSize: messageTextSize,
      messageTextAlign: messageTextAlign,
      messageTextColor: messageTextColor,
      isDismissible: isDismissible,
      btnYesText: btnYesText,
      color: color,
      radius: radius,
      onYes: onYes,
    );
  }

  static void error(
    BuildContext context, {
    Widget? icon,
    String? title,
    TextStyle? titleStyle,
    double titleTextSize = 18,
    TextAlign titleTextAlign = TextAlign.center,
    Color titleTextColor = Colors.black,
    String? message,
    TextStyle? messageStyle,
    double messageTextSize = 14,
    TextAlign messageTextAlign = TextAlign.center,
    Color messageTextColor = Vx.neutral500,
    bool isDismissible = true,
    String btnYesText = 'Close',
    Color color = const Color(0xFFEB373E),
    double radius = 16,
    Function()? onYes,
  }) {
    _base(
      context,
      icon: icon ?? Icon(Icons.error, size: 64, color: color).centered().pOnly(bottom: 16),
      title: title,
      titleStyle: titleStyle,
      titleTextSize: titleTextSize,
      titleTextAlign: titleTextAlign,
      titleTextColor: titleTextColor,
      message: message,
      messageStyle: messageStyle,
      messageTextSize: messageTextSize,
      messageTextAlign: messageTextAlign,
      messageTextColor: messageTextColor,
      isDismissible: isDismissible,
      btnYesText: btnYesText,
      color: color,
      radius: radius,
      onYes: onYes,
    );
  }

  static void confirm(
    BuildContext context, {
    Widget? icon,
    Color? color,
    double radius = 16,
    String? title,
    TextStyle? titleStyle,
    double titleTextSize = 18,
    TextAlign titleTextAlign = TextAlign.center,
    Color titleTextColor = Colors.black,
    String? message,
    TextStyle? messageStyle,
    double messageTextSize = 14,
    TextAlign messageTextAlign = TextAlign.center,
    Color messageTextColor = Vx.neutral500,
    bool isDismissible = true,
    String btnYesText = 'Yes',
    String btnNoText = 'No',
    Function()? onYes,
    Function()? onNo,
  }) {
    _base(
      context,
      icon: icon ?? Icon(Icons.help, size: 64, color: color).centered().pOnly(bottom: 16),
      title: title,
      titleStyle: titleStyle,
      titleTextSize: titleTextSize,
      titleTextAlign: titleTextAlign,
      titleTextColor: titleTextColor,
      message: message,
      messageStyle: messageStyle,
      messageTextSize: messageTextSize,
      messageTextAlign: messageTextAlign,
      messageTextColor: messageTextColor,
      isDismissible: isDismissible,
      color: color ?? Theme.of(context).primaryColor,
      radius: radius,
      btnYesText: btnYesText,
      onYes: onYes,
      btnNoText: btnNoText,
      onNo: onNo,
    );
  }

  static void custom(BuildContext context, {Widget? content}) {
    return _base(context, content: content);
  }

  static void _base(
    BuildContext context, {
    /// custom
    Widget? content,
    // icon
    Widget? icon,
    Color color = const Color(0xFF229C80),
    double radius = 16,

    // title
    String? title,
    TextStyle? titleStyle,
    double titleTextSize = 18,
    TextAlign titleTextAlign = TextAlign.center,
    Color titleTextColor = Colors.black,

    // message
    String? message,
    TextStyle? messageStyle,
    double messageTextSize = 14,
    TextAlign messageTextAlign = TextAlign.center,
    Color messageTextColor = Vx.neutral500,

    // isDismissible
    bool isDismissible = true,

    // button
    String? btnYesText,
    String? btnNoText,
    Function()? onYes,
    Function()? onNo,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => isDismissible,
          child: AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(radius))),
            scrollable: true,
            content: content ??
                VStack([
                  /// icon
                  if (icon != null) icon.centered().pOnly(bottom: 16),

                  /// title
                  if (title != null) ...[
                    Text(
                      title,
                      style: titleStyle ?? TextStyle(fontSize: titleTextSize, fontWeight: FontWeight.bold, color: titleTextColor),
                      textAlign: titleTextAlign,
                      maxLines: 2,
                    ).w(double.infinity),
                  ],

                  /// message
                  if (message != null)
                    Text(
                      message,
                      style: messageStyle ?? TextStyle(fontSize: messageTextSize, fontWeight: FontWeight.normal, color: messageTextColor),
                      textAlign: messageTextAlign,
                    ).w(double.infinity).pOnly(top: 12),
                ]),
            actions: [
              Column(
                children: [
                  /// yes
                  if (btnYesText != null) ...[
                    ExButtonElevated(
                      width: double.infinity,
                      label: btnYesText,
                      height: 50,
                      labelSize: 14,
                      backgroundColor: color,
                      labelColor: Colors.white,
                      onPressed: onYes ?? () => Navigator.pop(context),
                    ).cornerRadius(90).pOnly(left: 12, right: 12, bottom: 12),
                  ],

                  /// no
                  if (btnNoText != null) ...[
                    ExButtonText(
                      width: double.infinity,
                      label: btnNoText,
                      height: 50,
                      labelSize: 14,
                      backgroundColor: color,
                      onPressed: onNo ?? () => Navigator.pop(context),
                    ).cornerRadius(90).pOnly(left: 12, right: 12, bottom: 12),
                  ],
                ],
              ),
            ],
          ),
        );
      },
      barrierDismissible: isDismissible,
      useRootNavigator: true,
    );
  }
}
