import 'package:flutter/material.dart';

import 'flushbar.dart';

mixin ExSnackbar {
  static void success({
    required BuildContext context,
    String? title,
    double? titleSize,
    Color? titleColor = Colors.black,
    String? message,
    double? messageSize,
    Color? messageColor = Colors.black,
    Color backgroundColor = const Color(0xFFEFEFEF),
    IconData? icon = Icons.check_circle,
    Duration duration = const Duration(seconds: 3),
    double radius = 8,
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
      icon: Icon(icon, color: Colors.green[300]),
      leftBarIndicatorColor: Colors.green[300],
      borderRadius: BorderRadius.circular(radius),
      margin: EdgeInsets.all(margin),
      isDismissible: isDismissible,
      duration: duration,
      flushbarPosition: FlushbarPosition.TOP,
      shouldIconPulse: true,
    ).show(context);
  }

  /// Get an information notification flushbar
  static void info({
    required BuildContext context,
    String? title,
    double? titleSize,
    Color? titleColor = Colors.black,
    String? message,
    double? messageSize,
    Color? messageColor = Colors.black,
    Color backgroundColor = const Color(0xFFEFEFEF),
    IconData? icon = Icons.info,
    Duration duration = const Duration(seconds: 3),
    double radius = 8,
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
      icon: Icon(icon, color: Colors.blue[300]),
      leftBarIndicatorColor: Colors.blue[300],
      borderRadius: BorderRadius.circular(radius),
      margin: EdgeInsets.all(margin),
      isDismissible: isDismissible,
      duration: duration,
      flushbarPosition: FlushbarPosition.TOP,
      shouldIconPulse: true,
    ).show(context);
  }

  /// Get a error notification flushbar
  static void error({
    required BuildContext context,
    String? title,
    double? titleSize,
    Color? titleColor = Colors.black,
    String? message,
    double? messageSize,
    Color? messageColor = Colors.black,
    Color backgroundColor = const Color(0xFFEFEFEF),
    IconData? icon = Icons.warning,
    Duration duration = const Duration(seconds: 3),
    double radius = 8,
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
      icon: Icon(icon, color: Colors.red[300]),
      leftBarIndicatorColor: Colors.red[300],
      borderRadius: BorderRadius.circular(radius),
      margin: EdgeInsets.all(margin),
      isDismissible: isDismissible,
      duration: duration,
      flushbarPosition: FlushbarPosition.TOP,
      shouldIconPulse: true,
    ).show(context);
  }

  /// Get a flushbar that can receive a user action through a button.
  static void action({
    required BuildContext context,
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
    ).show(context);
  }

  // Get a flushbar that shows the progress of a async computation.
  static void uploading({
    required BuildContext context,
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
    ).show(context);
  }

  // /// Get a flushbar that shows an user input form.
  // static void createInputFlushbar({
  //   required BuildContext context,
  //   required Form textForm,
  // }) {
  //   Flushbar(
  //     duration: null,
  //     userInputForm: textForm,
  //   ).show(context);
  // }
}
