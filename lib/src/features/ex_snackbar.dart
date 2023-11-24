import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../ex.dart';

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
  // neutral
  // —————————————————————————————————————————————————————————————————————————————
  static void neutralTop(
    dynamic message, {
    Duration duration = const Duration(seconds: 3),
    SnackPosition position = SnackPosition.TOP,
  }) {
    if (!Get.isSnackbarOpen) {
      Get.snackbar(
        '',
        titleText: 0.heightBox,
        message,
        colorText: Colors.white,
        backgroundColor: Colors.black,
        icon: Icon(Icons.info, color: Colors.white),
        leftBarIndicatorColor: Colors.white30,
        borderRadius: 4,
        margin: EdgeInsets.all(8),
        isDismissible: true,
        duration: duration,
        snackPosition: position,
      );
    }
  }

  // —————————————————————————————————————————————————————————————————————————————
  // info
  // —————————————————————————————————————————————————————————————————————————————
  static void infoTop(
    dynamic message, {
    Duration duration = const Duration(seconds: 3),
    SnackPosition position = SnackPosition.TOP,
  }) {
    if (!Get.isSnackbarOpen) {
      Get.snackbar(
        '',
        titleText: 0.heightBox,
        message,
        colorText: Colors.black,
        backgroundColor: Colors.blue[50],
        icon: Icon(Icons.info, color: Colors.blue),
        leftBarIndicatorColor: Colors.blue,
        borderRadius: 4,
        margin: EdgeInsets.all(8),
        isDismissible: true,
        duration: duration,
        snackPosition: position,
      );
    }
  }

  // —————————————————————————————————————————————————————————————————————————————
  // danger
  // —————————————————————————————————————————————————————————————————————————————
  static void dangerTop(
    dynamic message, {
    Duration duration = const Duration(seconds: 3),
    SnackPosition position = SnackPosition.TOP,
  }) {
    if (!Get.isSnackbarOpen) {
      Get.snackbar(
        '',
        titleText: 0.heightBox,
        message,
        colorText: Colors.black,
        backgroundColor: Colors.red[50],
        icon: Icon(Icons.info, color: Colors.red),
        leftBarIndicatorColor: Colors.red,
        borderRadius: 4,
        margin: EdgeInsets.all(8),
        isDismissible: true,
        duration: duration,
        snackPosition: position,
      );
    }
  }

  // —————————————————————————————————————————————————————————————————————————————
  // warning
  // —————————————————————————————————————————————————————————————————————————————
  static void warningTop(
    dynamic message, {
    Duration duration = const Duration(seconds: 3),
    SnackPosition position = SnackPosition.TOP,
  }) {
    if (!Get.isSnackbarOpen) {
      Get.snackbar(
        '',
        titleText: 0.heightBox,
        message,
        colorText: Colors.black,
        backgroundColor: Colors.orange[50],
        icon: Icon(Icons.info, color: Colors.orange),
        leftBarIndicatorColor: Colors.orange,
        borderRadius: 4,
        margin: EdgeInsets.all(8),
        isDismissible: true,
        duration: duration,
        snackPosition: position,
      );
    }
  }

  // —————————————————————————————————————————————————————————————————————————————
  // success
  // —————————————————————————————————————————————————————————————————————————————
  static void successTop(
    dynamic message, {
    Duration duration = const Duration(seconds: 3),
    SnackPosition position = SnackPosition.TOP,
  }) {
    if (!Get.isSnackbarOpen) {
      Get.snackbar(
        '',
        titleText: 0.heightBox,
        message,
        colorText: Colors.black,
        backgroundColor: Colors.green[50],
        icon: Icon(Icons.info, color: Colors.green),
        leftBarIndicatorColor: Colors.green,
        borderRadius: 4,
        margin: EdgeInsets.all(8),
        isDismissible: true,
        duration: duration,
        snackPosition: position,
      );
    }
  }

  // —————————————————————————————————————————————————————————————————————————————
  // ver2 : bottom
  // —————————————————————————————————————————————————————————————————————————————

  static void neutral(dynamic message, {int? duration, bool showIcon = true}) {
    final snackBar = SnackBar(
      content: HStack([
        if (showIcon == true) Icon(Icons.info, color: Colors.white),
        12.widthBox,
        '$message'.text.white.ellipsis.maxLines(3).make().expand(),
      ]),
      backgroundColor: Colors.black,
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: duration ?? 2),
    );
    ScaffoldMessenger.of(Get.context!)
        .showSnackBar(snackBar)
        .closed
        .then((value) => ScaffoldMessenger.of(Get.context!).clearSnackBars());
  }

  static void info(dynamic message, {int? duration, bool showIcon = true}) {
    final snackBar = SnackBar(
      content: HStack([
        if (showIcon == true) Icon(Icons.info, color: Colors.blue[800]),
        12.widthBox,
        '$message'
            .text
            .color(Colors.black)
            .overflow(TextOverflow.ellipsis)
            .maxLines(3)
            .make()
            .expand(),
      ]).p12(),
      padding: EdgeInsets.all(0),
      backgroundColor: Colors.blue[50],
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: duration ?? 2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(color: Colors.blue[800]!),
      ),
    );
    ScaffoldMessenger.of(Get.context!)
        .showSnackBar(snackBar)
        .closed
        .then((value) => ScaffoldMessenger.of(Get.context!).clearSnackBars());
  }

  static void danger(dynamic message, {int? duration, bool showIcon = true}) {
    final snackBar = SnackBar(
      content: HStack([
        if (showIcon == true) Icon(Icons.info, color: Colors.red[800]),
        12.widthBox,
        '$message'
            .text
            .color(Colors.black)
            .overflow(TextOverflow.ellipsis)
            .maxLines(3)
            .make()
            .expand(),
      ]).p12(),
      padding: EdgeInsets.all(0),
      backgroundColor: Colors.red[50],
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: duration ?? 2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(color: Colors.red[800]!),
      ),
    );
    ScaffoldMessenger.of(Get.context!)
        .showSnackBar(snackBar)
        .closed
        .then((value) => ScaffoldMessenger.of(Get.context!).clearSnackBars());
  }

  static void success(dynamic message, {int? duration, bool showIcon = true}) {
    final snackBar = SnackBar(
      content: HStack([
        if (showIcon == true) Icon(Icons.info, color: Colors.green[800]),
        12.widthBox,
        '$message'
            .text
            .color(Colors.black)
            .overflow(TextOverflow.ellipsis)
            .maxLines(3)
            .make()
            .expand(),
      ]).p12(),
      padding: EdgeInsets.all(0),
      backgroundColor: Colors.green[50],
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: duration ?? 2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(color: Colors.green[800]!),
      ),
    );
    ScaffoldMessenger.of(Get.context!)
        .showSnackBar(snackBar)
        .closed
        .then((value) => ScaffoldMessenger.of(Get.context!).clearSnackBars());
  }

  static void warning(dynamic message, {int? duration, bool showIcon = true}) {
    final snackBar = SnackBar(
      content: HStack([
        if (showIcon == true) Icon(Icons.info, color: Colors.orange[800]),
        12.widthBox,
        '$message'
            .text
            .color(Colors.black)
            .overflow(TextOverflow.ellipsis)
            .maxLines(3)
            .make()
            .expand(),
      ]).p12(),
      padding: EdgeInsets.all(0),
      backgroundColor: Colors.orange[50],
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: duration ?? 2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(color: Colors.orange[800]!),
      ),
    );
    ScaffoldMessenger.of(Get.context!)
        .showSnackBar(snackBar)
        .closed
        .then((value) => ScaffoldMessenger.of(Get.context!).clearSnackBars());
  }
}
