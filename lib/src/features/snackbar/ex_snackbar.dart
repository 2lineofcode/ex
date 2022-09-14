import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../ex.dart';

/*
 * ExSnackbar
 * Created by Aditya Pratama
 * https://adit.com
 *
 * Copyright (c) 2021 MDVK, LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */
mixin ExSnackbar {
  // —————————————————————————————————————————————————————————————————————————————
  // info
  // —————————————————————————————————————————————————————————————————————————————
  static void infoTop(
    String message, {
    String? title,
    double? titleSize,
    Color? titleColor = Colors.black,
    double? messageSize,
    Color? messageColor = Colors.black,
    Color backgroundColor = const Color(0xffF3F6FE),
    IconData? icon = Icons.info,
    Duration duration = const Duration(seconds: 3),
    double radius = 4,
    double margin = 8,
    FlushbarPosition position = FlushbarPosition.TOP,
    bool isDismissible = true,
  }) {
    Flushbar(
      title: title,
      titleSize: titleSize,
      titleColor: titleColor,
      message: message,
      messageSize: messageSize,
      messageColor: messageColor,
      backgroundColor: backgroundColor,
      icon: Icon(icon, color: Color(0xFF22328F)),
      leftBarIndicatorColor: Color(0xFF22328F),
      borderRadius: BorderRadius.circular(radius),
      margin: EdgeInsets.all(margin),
      isDismissible: isDismissible,
      duration: duration,
      flushbarPosition: position,
    ).show(Get.context!);
  }

  // —————————————————————————————————————————————————————————————————————————————
  // danger
  // —————————————————————————————————————————————————————————————————————————————
  static void dangerTop(
    String message, {
    String? title,
    double? titleSize,
    Color? titleColor = Colors.black,
    double? messageSize,
    Color? messageColor = Colors.black,
    Color backgroundColor = const Color(0xFFFFF4F5),
    IconData? icon = Icons.info,
    Duration duration = const Duration(seconds: 3),
    double radius = 4,
    double margin = 4,
    FlushbarPosition position = FlushbarPosition.TOP,
    bool isDismissible = true,
  }) {
    Flushbar(
      title: title,
      titleSize: titleSize,
      titleColor: titleColor,
      message: message,
      messageSize: messageSize,
      messageColor: messageColor,
      backgroundColor: backgroundColor,
      icon: Icon(icon, color: Colors.red[800]),
      leftBarIndicatorColor: Colors.red[800],
      borderRadius: BorderRadius.circular(radius),
      margin: EdgeInsets.all(margin),
      isDismissible: isDismissible,
      duration: duration,
      flushbarPosition: position,
    ).show(Get.context!);
  }

  // —————————————————————————————————————————————————————————————————————————————
  // warning
  // —————————————————————————————————————————————————————————————————————————————
  static void warningTop(
    String message, {
    String? title,
    double? titleSize,
    Color? titleColor = Colors.black,
    double? messageSize,
    Color? messageColor = Colors.black,
    Color backgroundColor = const Color(0xFFFFFDF3),
    IconData? icon = Icons.warning,
    Duration duration = const Duration(seconds: 3),
    double radius = 4,
    double margin = 4,
    FlushbarPosition position = FlushbarPosition.TOP,
    bool isDismissible = true,
  }) {
    Flushbar(
      title: title,
      titleSize: titleSize,
      titleColor: titleColor,
      message: message,
      messageSize: messageSize,
      messageColor: messageColor,
      backgroundColor: backgroundColor,
      icon: Icon(icon, color: Color(0xFFF69348)),
      leftBarIndicatorColor: Color(0xFFF69348),
      borderRadius: BorderRadius.circular(radius),
      margin: EdgeInsets.all(margin),
      isDismissible: isDismissible,
      duration: duration,
      flushbarPosition: position,
    ).show(Get.context!);
  }

  // —————————————————————————————————————————————————————————————————————————————
  // success
  // —————————————————————————————————————————————————————————————————————————————
  static void successTop(
    String message, {
    String? title,
    double? titleSize,
    Color? titleColor = Colors.black,
    double? messageSize,
    Color? messageColor = Colors.black,
    Color backgroundColor = const Color(0xFFE9F5F2),
    IconData? icon = Icons.check_circle,
    Duration duration = const Duration(seconds: 3),
    double radius = 4,
    double margin = 4,
    FlushbarPosition position = FlushbarPosition.TOP,
    bool isDismissible = true,
  }) {
    Flushbar(
      title: title,
      titleSize: titleSize,
      titleColor: titleColor,
      message: message,
      messageSize: messageSize,
      messageColor: messageColor,
      backgroundColor: backgroundColor,
      icon: Icon(icon, color: Colors.green[800]),
      leftBarIndicatorColor: Colors.green[800],
      borderRadius: BorderRadius.circular(radius),
      margin: EdgeInsets.all(margin),
      isDismissible: isDismissible,
      duration: duration,
      flushbarPosition: position,
    ).show(Get.context!);
  }

  // —————————————————————————————————————————————————————————————————————————————
  // action
  // —————————————————————————————————————————————————————————————————————————————
  static void action({
    required String message,
    required Widget button,
    String? title,
    Duration duration = const Duration(seconds: 3),
  }) {
    Flushbar(
      title: title,
      message: message,
      duration: duration,
      mainButton: button,
    ).show(Get.context!);
  }

  static void uploading({
    required String message,
    String? title,
    Duration duration = const Duration(seconds: 3),
    AnimationController? progressIndicatorController,
    Color? progressIndicatorBackgroundColor,
  }) {
    Flushbar(
      title: title,
      message: message,
      icon: Icon(Icons.cloud_upload, color: Colors.blue[300]),
      duration: duration,
      showProgressIndicator: true,
      progressIndicatorController: progressIndicatorController,
      progressIndicatorBackgroundColor: progressIndicatorBackgroundColor,
    ).show(Get.context!);
  }

  // —————————————————————————————————————————————————————————————————————————————
  // ver2 : bottom
  // —————————————————————————————————————————————————————————————————————————————

  static void neutral(String message, {int? duration, bool showIcon = true}) {
    final snackBar = SnackBar(
      content: HStack([
        if (showIcon == true) Icon(Icons.info, color: Colors.white),
        12.widthBox,
        message.text.black.overflow(TextOverflow.ellipsis).maxLines(3).make().expand(),
      ]),
      backgroundColor: Colors.black,
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: duration ?? 2),
    );
    ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
  }

  static void info(String message, {int? duration, bool showIcon = true}) {
    final snackBar = SnackBar(
      content: Container(
        decoration: DecoratorHelper.commonBoxDecoration(borderColor: Color(0xFF093479)),
        child: HStack([
          if (showIcon == true) Icon(Icons.info, color: Color(0xFF093479)),
          12.widthBox,
          message.text.black.overflow(TextOverflow.ellipsis).maxLines(3).make().expand(),
        ]).p12(),
      ),
      padding: EdgeInsets.all(0),
      backgroundColor: Color(0xFFE8F9FE),
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: duration ?? 2),
    );
    ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
  }

  static void danger(String message, {int? duration, bool showIcon = true}) {
    final snackBar = SnackBar(
      content: Container(
        decoration: DecoratorHelper.commonBoxDecoration(borderColor: Color(0xFF881135)),
        child: HStack([
          if (showIcon == true) Icon(Icons.info, color: Color(0xFF881135)),
          12.widthBox,
          message.text.black.overflow(TextOverflow.ellipsis).maxLines(3).make().expand(),
        ]).p12(),
      ),
      padding: EdgeInsets.all(0),
      backgroundColor: Color(0xFFFFF4F5),
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: duration ?? 2),
    );
    ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
  }

  static void success(String message, {int? duration, bool showIcon = true}) {
    final snackBar = SnackBar(
      content: Container(
        decoration: DecoratorHelper.commonBoxDecoration(borderColor: Color(0xFF0E3E33)),
        child: HStack([
          if (showIcon == true) Icon(Icons.check_circle, color: Color(0xFF0E3E33)),
          12.widthBox,
          message.text.black.overflow(TextOverflow.ellipsis).maxLines(3).make().expand(),
        ]).p12(),
      ),
      padding: EdgeInsets.all(0),
      backgroundColor: Color(0xFFE9F5F2),
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: duration ?? 2),
    );
    ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
  }

  static void warning(String message, {int? duration, bool showIcon = true}) {
    final snackBar = SnackBar(
      content: Container(
        decoration: DecoratorHelper.commonBoxDecoration(borderColor: Color(0xFF93662A)),
        child: HStack([
          if (showIcon == true) Icon(Icons.warning, color: Color(0xFF93662A)),
          12.widthBox,
          message.text.black.overflow(TextOverflow.ellipsis).maxLines(3).make().expand(),
        ]).p12(),
      ),
      padding: EdgeInsets.all(0),
      backgroundColor: Color(0xFFFFFDF3),
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: duration ?? 2),
    );
    ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
  }
}
