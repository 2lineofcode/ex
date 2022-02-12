import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:velocity_x/velocity_x.dart';

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
    required BuildContext context,
    bool isDismissible = false,
    String? message = '',
  }) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
          insetPadding: EdgeInsets.symmetric(horizontal: 120),
          content: VStack(
            [
              Center(
                child: VStack([
                  LoadingAnimationWidget.discreteCircle(
                    color: Theme.of(context).primaryColor,
                    size: 32,
                    // rightDotColor: Theme.of(context).primaryColor,
                    // leftDotColor: Theme.of(context).errorColor,
                  ).centered(),
                  if (!message.isEmptyOrNull)
                    VStack([
                      16.heightBox,
                      Text(message!, textAlign: TextAlign.center, style: TextStyle(fontSize: 14)).centered(),
                    ]),
                ]),
              ),
            ],
          ),
        );
      },
    );
  }

  static void dismiss(BuildContext context) {
    Navigator.maybePop(context);
  }
}
