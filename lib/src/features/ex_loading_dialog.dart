import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import 'loading_animation/loading_animation_widget.dart';

/*
 * ExLoading
 * Created by Aditya Pratama
 * https://adit.web.id
 *
 * Copyright (c) 2021 MDVK, LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 *
 * -- example implementation
 * ```dart
 * void loading() {
 *    ExLoading.show(context: Get.context!);
 *    Future.delayed(3.seconds).then((value) => ExLoading.dismiss(Get.context!));
 * }
 * ```
 */
mixin ExLoading {
  /// -- example implementation
  /// ```dart
  /// void loading() {
  ///    ExLoading.show(context: Get.context!);
  ///    Future.delayed(3.seconds).then((value) => ExLoading.dismiss(Get.context!));
  /// }
  /// ```
  static void show({
    bool isDismissible = false,
    String? message = '',
    double? messageSize = 14,
    Widget? imageAsset,
  }) {
    Get.dialog(
      AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
        insetPadding: EdgeInsets.symmetric(horizontal: 120),
        content: VStack(
          [
            Center(
              child: VStack([
                if (imageAsset != null)
                  imageAsset
                else
                  LoadingAnimationWidget.discreteCircle(
                    color: Theme.of(Get.context!).primaryColor,
                    size: 32,
                  ).centered(),
                if (!message.isEmptyOrNull)
                  VStack([
                    16.heightBox,
                    message!.text.align(TextAlign.center).size(messageSize).makeCentered(),
                  ]).centered(),
              ]),
            ),
          ],
        ),
      ),
      barrierDismissible: isDismissible,
      useSafeArea: true,
    );
  }

  static void dismiss() {
    if (Get.isDialogOpen == true) {
      Get.back();
    }
  }
}
