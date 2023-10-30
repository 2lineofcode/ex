import 'package:ex_kit/ex.dart';
import 'package:flutter/material.dart';

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
  static bool isDialogOpen = false;

  /// -- example implementation
  /// ```dart
  /// void loading() {
  ///    ExLoading.show(context: Get.context!);
  ///    Future.delayed(3.seconds).then((value) => ExLoading.dismiss(Get.context!));
  /// }
  /// ```
  static void show(
    BuildContext context, {
    bool isDismissible = true,
    Widget? child,
    Color? barrierColor,
    String? message,
    double? paddingSymmetric,
  }) {
    isDialogOpen = true;
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: child?.p24() ??
              VStack(
                [
                  LoadingAnimationWidget.discreteCircle(
                    color: Theme.of(context).primaryColor,
                    size: 32,
                  ).centered(),
                  if (message != null) Text(message, textAlign: TextAlign.center).centered().pOnly(top: 16),
                ],
              ).p24(),
        ).pSymmetric(h: paddingSymmetric ?? 90);
      },
      barrierDismissible: isDismissible,
      // barrierColor: barrierColor,
    ).then((_) {
      isDialogOpen = false;
    });
  }

  static void dismiss(BuildContext context) {
    if (isDialogOpen == true) Navigator.pop(context);
  }
}
