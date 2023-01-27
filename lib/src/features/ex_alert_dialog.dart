// ignore_for_file: non_constant_identifier_names, deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../ex.dart';
import '../color.dart';

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
    // icon
    Widget? icon,
    bool showIcon = true,
    // title
    String title = 'Success',
    TextStyle? titleStyle,
    double titleTextSize = 18,
    TextAlign titleTextAlign = TextAlign.left,
    Color titleTextColor = Colors.black,
    // message
    String? message,
    TextStyle? messageStyle,
    double messageTextSize = 13,
    TextAlign messageTextAlign = TextAlign.left,
    Color messageTextColor = colorNeutral,
    // isDismissible
    bool isDismissible = true,
    // button
    String btnOkText = 'Close',
    Color? barrierColor = Colors.black54,
    double cornerRadius = 4.0,
    Function()? onYes,
  }) {
    showDialog(
      context: Get.context!,
      barrierDismissible: isDismissible,
      barrierColor: barrierColor,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => isDismissible,
          child: AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(cornerRadius),
              ),
            ),
            // contentPadding: EdgeInsets.all(16),
            scrollable: true,
            content: VStack([
              if (showIcon || icon != null)
                VStack([
                  if (icon != null)
                    icon
                  else
                    Icon(
                      CupertinoIcons.check_mark_circled,
                      size: 90,
                      color: Theme.of(context).primaryColor,
                    ).centered().pOnly(bottom: 24)
                ]),
              Text(
                title,
                style: titleStyle ?? TextStyle(fontSize: titleTextSize, fontWeight: FontWeight.bold, color: titleTextColor),
                textAlign: titleTextAlign,
                maxLines: 2,
              ).w(double.infinity),
              if (message != null)
                Text(
                  message,
                  style: messageStyle ?? TextStyle(fontSize: messageTextSize, fontWeight: FontWeight.normal, color: messageTextColor),
                  textAlign: messageTextAlign,
                ).w(double.infinity).pOnly(top: 12),
            ]),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Theme.of(context).primaryColor),
                    onPressed: onYes ?? Get.back,
                    child: Text(btnOkText),
                  ).pOnly(left: 12, right: 12, bottom: 12).h(55).expand(),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  /// -- example implementation --
  /// ```dart
  /// ExAlert.error(
  ///   context: Get.context!,
  ///   title: 'Failed :"))',
  ///   message: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
  ///   onYes: () => print('clicked'),
  /// );
  /// ```
  static void error({
    Widget? icon,
    bool showIcon = true,
    String? title,
    TextStyle? titleStyle,
    double titleTextSize = 18,
    TextAlign titleTextAlign = TextAlign.left,
    Color titleTextColor = Colors.black,
    String? message,
    TextStyle? messageStyle,
    double messageTextSize = 13,
    TextAlign messageTextAlign = TextAlign.left,
    Color messageTextColor = colorNeutral,
    bool isDismissible = true,
    String btnYesText = 'Close',
    Color? barrierColor = Colors.black54,
    double cornerRadius = 4.0,
    Function()? onYes,
  }) {
    showDialog(
      context: Get.context!,
      barrierDismissible: isDismissible,
      barrierColor: barrierColor,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => isDismissible,
          child: AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(cornerRadius))),
            // contentPadding: EdgeInsets.all(16),
            scrollable: true,
            content: VStack([
              if (showIcon)
                VStack([
                  if (icon != null)
                    icon
                  else
                    Icon(
                      CupertinoIcons.clear_circled,
                      size: 90,
                      color: Theme.of(context).errorColor,
                    ).centered().pOnly(bottom: 24),
                ]),
              if (title != null)
                Text(
                  title,
                  style: titleStyle ?? TextStyle(fontSize: titleTextSize, fontWeight: FontWeight.bold, color: titleTextColor),
                  textAlign: titleTextAlign,
                  maxLines: 2,
                ).w(double.infinity),
              if (message != null)
                Text(
                  message,
                  style: messageStyle ?? TextStyle(fontSize: messageTextSize, fontWeight: FontWeight.normal, color: messageTextColor),
                  textAlign: messageTextAlign,
                ).w(double.infinity).pOnly(top: 12),
            ]),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Theme.of(context).errorColor),
                    onPressed: onYes ?? Get.back,
                    child: Text(btnYesText),
                  ).pOnly(left: 12, right: 12, bottom: 12).h(55).expand(),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  /// -- example implementation --
  /// ```dart
  /// ExAlert.confirm(
  ///   context: Get.context!,
  ///   title: 'Some Question',
  ///   message: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry?',
  ///   onYes: () => print('yes clicked'),
  ///   onNo: () => print('no clicked'),
  /// );
  /// ```
  static void confirm({
    Widget? icon,
    bool showIcon = true,
    String? title,
    TextStyle? titleStyle,
    double titleTextSize = 18,
    TextAlign titleTextAlign = TextAlign.left,
    Color titleTextColor = Colors.black,
    String? message,
    TextStyle? messageStyle,
    double messageTextSize = 13,
    TextAlign messageTextAlign = TextAlign.left,
    Color messageTextColor = colorNeutral,
    bool isDismissible = true,
    String btnNoText = 'No',
    Function()? onNo,
    String btnYesText = 'Yes',
    Function()? onYes,
    bool isWarningMode = false,
    Color? barrierColor = Colors.black54,
    double cornerRadius = 4.0,
  }) {
    showDialog(
      context: Get.context!,
      barrierDismissible: isDismissible,
      barrierColor: barrierColor,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => isDismissible,
          child: AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(cornerRadius))),
            scrollable: true,
            content: VStack([
              if (showIcon)
                VStack([
                  if (icon != null)
                    icon
                  else
                    Icon(
                      CupertinoIcons.question_circle,
                      size: 90,
                      color: isWarningMode == true ? colorError : Theme.of(context).primaryColor,
                    ).centered().pOnly(bottom: 24),
                ]),
              if (title != null)
                Text(
                  title,
                  style: titleStyle ?? TextStyle(fontSize: titleTextSize, fontWeight: FontWeight.bold, color: titleTextColor),
                  textAlign: titleTextAlign,
                  maxLines: 2,
                ).w(double.infinity),
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
                  SizedBox(
                    width: double.infinity,
                    height: 44,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: isWarningMode == true ? Theme.of(context).errorColor : Theme.of(context).primaryColor),
                      onPressed: onYes ?? Get.back,
                      child: Text(btnYesText),
                    ),
                  ),
                  12.heightBox,
                  SizedBox(
                    width: double.infinity,
                    height: 44,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        primary: isWarningMode == true ? Theme.of(context).errorColor : Colors.black,
                        side: BorderSide(color: isWarningMode == true ? Theme.of(context).errorColor : colorNeutral[300]!),
                      ),
                      onPressed: onNo ?? Get.back,
                      child: Text(btnNoText),
                    ),
                  ),
                  12.heightBox,
                ],
              ).pOnly(left: 12, right: 12),
            ],
          ),
        );
      },
    );
  }

  static void custom({
    Widget? body,
    List<Widget>? action,
    bool isDismissible = true,
    Color? barrierColor = Colors.black54,
    double cornerRadius = 4.0,
    Function()? onYes,
  }) {
    showDialog(
      context: Get.context!,
      barrierDismissible: isDismissible,
      barrierColor: barrierColor,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => isDismissible,
          child: AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(cornerRadius))),
            scrollable: true,
            content: body,
            actions: action,
          ),
        );
      },
    );
  }
}
