import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
  ///   context: Get.context!,
  ///   title: 'Hello World',
  ///   message: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
  ///   onYes: () => print('clicked'),
  /// );
  /// ```

  static void success({
    Widget? icon,
    String? title,
    TextStyle? titleStyle,
    double titleTextSize = 18,
    TextAlign titleTextAlign = TextAlign.center,
    Color? titleTextColor,
    String? message,
    TextStyle? messageStyle,
    double messageTextSize = 14,
    TextAlign messageTextAlign = TextAlign.center,
    Color? messageTextColor,
    bool isDismissible = true,
    String btnYesText = 'Close',
    Color color = const Color(0xFF229C80),
    double radius = 16,
    Function()? onYes,
  }) {
    _base(
      icon: icon ??
          Icon(Icons.check_circle, size: 64, color: color)
              .centered()
              .pOnly(bottom: 16),
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

  static void error({
    Widget? icon,
    String? title,
    TextStyle? titleStyle,
    double titleTextSize = 18,
    TextAlign titleTextAlign = TextAlign.center,
    Color? titleTextColor,
    String? message,
    TextStyle? messageStyle,
    double messageTextSize = 14,
    TextAlign messageTextAlign = TextAlign.center,
    Color? messageTextColor,
    bool isDismissible = true,
    String btnYesText = 'Close',
    Color color = const Color(0xFFEB373E),
    double radius = 16,
    Function()? onYes,
  }) {
    _base(
      icon: icon ??
          Icon(Icons.error, size: 64, color: color)
              .centered()
              .pOnly(bottom: 16),
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

  static void confirm({
    Widget? icon,
    Color? color,
    double radius = 16,
    String? title,
    TextStyle? titleStyle,
    double titleTextSize = 18,
    TextAlign titleTextAlign = TextAlign.center,
    Color? titleTextColor,
    String? message,
    TextStyle? messageStyle,
    double messageTextSize = 14,
    TextAlign messageTextAlign = TextAlign.center,
    Color? messageTextColor,
    bool isDismissible = true,
    String btnYesText = 'Yes',
    String btnNoText = 'No',
    Function()? onYes,
    Function()? onNo,
  }) {
    _base(
      icon: icon ??
          Icon(Icons.help, size: 64, color: color).centered().pOnly(bottom: 16),
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
      color: color ?? Theme.of(Get.context!).primaryColor,
      radius: radius,
      btnYesText: btnYesText,
      onYes: onYes,
      btnNoText: btnNoText,
      onNo: onNo,
    );
  }

  static void adaptive({
    bool? isDismissible,
    Widget? title,
    Widget? content,
    List<Widget>? actions,
    double? radius,
  }) {
    showAdaptiveDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        if (Platform.isMacOS || Platform.isMacOS) {
          return CupertinoAlertDialog(
            title: title,
            content: content,
            actions: actions ?? [],
          );
        } else {
          return AlertDialog(
            title: title,
            content: content,
            actions: actions ?? [],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius ?? 12),
            ),
          );
        }
      },
      barrierDismissible: isDismissible ?? true,
    );
  }

  static void custom({Widget? content}) {
    return _base(content: content);
  }

  static void _base({
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
    Color? titleTextColor,

    // message
    String? message,
    TextStyle? messageStyle,
    double messageTextSize = 14,
    TextAlign messageTextAlign = TextAlign.center,
    Color? messageTextColor,

    // isDismissible
    bool isDismissible = true,

    // button
    String? btnYesText,
    String? btnNoText,
    Function()? onYes,
    Function()? onNo,
  }) {
    Get.dialog(
      AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(radius)),
        ),
        scrollable: true,
        content: content ??
            VStack([
              /// icon
              if (icon != null) icon.centered().pOnly(bottom: 16),

              /// title
              if (title != null) ...[
                Text(
                  title,
                  style: titleStyle ??
                      TextStyle(
                        fontSize: titleTextSize,
                        fontWeight: FontWeight.bold,
                        color: titleTextColor,
                        overflow: TextOverflow.ellipsis,
                      ),
                  textAlign: titleTextAlign,
                  maxLines: 2,
                ).w(double.infinity),
              ],

              /// message
              if (message != null)
                Text(
                  message,
                  style: messageStyle ??
                      TextStyle(
                        fontSize: messageTextSize,
                        fontWeight: FontWeight.normal,
                        color: messageTextColor,
                      ),
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
                  onPressed: onYes ?? Get.back,
                ).cornerRadius(90).pOnly(left: 8, right: 8, bottom: 8),
              ],

              /// no
              if (btnNoText != null) ...[
                ExButtonText(
                  width: double.infinity,
                  label: btnNoText,
                  height: 50,
                  labelSize: 14,
                  onPressed: onNo ?? Get.back,
                ).cornerRadius(90).pOnly(left: 8, right: 8, bottom: 8),
              ],
            ],
          ),
        ],
      ),
      barrierDismissible: isDismissible,
      transitionCurve: Curves.easeInCirc,
    );
  }
}
