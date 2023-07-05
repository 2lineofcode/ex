import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../widgets/ex_progressbar.dart';

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
    double? radius,
    Color? backgroundColor,
  }) {
    Get.dialog(
      AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(radius ?? 10))),
        insetPadding: EdgeInsets.symmetric(horizontal: 120),
        backgroundColor: backgroundColor,
        content: VStack(
          [
            Center(
              child: child ??
                  LoadingAnimationWidget.discreteCircle(
                    color: Theme.of(Get.context!).primaryColor,
                    size: 32,
                  ).centered(),
            ),
          ],
        ),
      ),
      barrierDismissible: isDismissible,
      useSafeArea: true,
    );
  }

  static void dismiss() {
    if (Get.isDialogOpen == true) Get.back();
  }
}
