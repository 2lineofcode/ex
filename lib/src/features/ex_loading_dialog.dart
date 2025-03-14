import 'dart:async';

import 'package:ex_kit/ex.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    bool isDismissible = true,
    Widget? child,
    Color? barrierColor,
    String? message,
    double? paddingSymmetric,
  }) {
    final showCancel = false.obs;
    Future.delayed(5.seconds, () {
      showCancel.value = true;
    });

    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: child?.p24() ??
            VStack(
              [
                LoadingAnimationWidget.discreteCircle(
                  color: Theme.of(Get.context!).primaryColor,
                  size: 32,
                ).centered(),
                if (message != null)
                  Text(message, textAlign: TextAlign.center)
                      .centered()
                      .pOnly(top: 16),
                Obx(
                  () => showCancel.value == true
                      ? ExButtonOutline(
                          label: 'Cancel',
                          height: 40,
                          onPressed: Get.back,
                        ).pOnly(top: 24).centered()
                      : Container(),
                ),
              ],
            ).p24(),
      ).pSymmetric(h: paddingSymmetric ?? 90),
      barrierDismissible: isDismissible,
      barrierColor: barrierColor,
    );
  }

  static void dismiss() {
    if (Get.isDialogOpen == true) Get.back();
  }
}
