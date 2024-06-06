import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
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
    Widget? icon,
    Widget? title,
    Widget? content,
    List<Widget>? actions,
    double? radius,
    double? padding,
  }) {
    showAdaptiveDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        if (kIsWeb) {
          return CupertinoAlertDialog(
            title: title,
            content: content,
            actions: actions ?? [],
          );
        }

        if (Platform.isIOS ||
            Platform.isMacOS ||
            Platform.isWindows ||
            Platform.isLinux) {
          return CupertinoAlertDialog(
            title: title,
            content: content,
            actions: actions ?? [],
          );
        } else {
          return AlertDialog(
            icon: icon,
            title: title,
            content: content,
            actions: actions ?? [],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius ?? 12),
            ),
            contentPadding: EdgeInsets.all(padding ?? 12),
            iconPadding: EdgeInsets.only(top: 12),
            actionsPadding: EdgeInsets.only(bottom: 12),
            titlePadding: EdgeInsets.symmetric(horizontal: 12),
            scrollable: true,
          );
        }
      },
      barrierDismissible: isDismissible ?? true,
    );
  }

  static void custom({
    String? title,
    Widget? content,
    List<Widget>? actions,
    double? padding,
  }) {
    return _base(
      title: title,
      content: content,
      actions: actions,
      padding: padding ?? 0,
    );
  }

  static void _base({
    /// custom
    Widget? content,
    List<Widget>? actions,
    // icon
    Widget? icon,
    Color color = const Color(0xFF229C80),
    double radius = 12,
    double padding = 12,

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
        contentPadding: EdgeInsets.all(padding),
        iconPadding: EdgeInsets.only(top: 12),
        actionsPadding: EdgeInsets.only(bottom: 12),
        titlePadding: EdgeInsets.symmetric(horizontal: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(radius)),
        ),
        scrollable: true,
        icon: icon ?? 0.heightBox,
        title: title != null
            ? Text(
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
              )
            : 0.heightBox,
        content: content ??
            VStack([
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
                ).w(double.infinity).pOnly(top: 8, bottom: 8),
            ]),
        actions: actions ??
            [
              if (btnYesText != null) ...[
                ExButtonElevated(
                  width: double.infinity,
                  label: btnYesText,
                  height: 50,
                  labelSize: 14,
                  backgroundColor: color,
                  labelColor: Colors.white,
                  onPressed: onYes ?? Get.back,
                ).pSymmetric(h: 12),
              ],

              /// no
              if (btnNoText != null) ...[
                8.heightBox,
                ExButtonText(
                  width: double.infinity,
                  label: btnNoText,
                  height: 50,
                  labelSize: 14,
                  onPressed: onNo ?? Get.back,
                ).pSymmetric(h: 12),
              ],
            ],
      ),
      barrierDismissible: isDismissible,
      transitionCurve: Curves.easeInCirc,
    );
  }
}
