// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../ex.dart';

/*
 * ExDialog
 * Created by Aditya Pratama
 * https://adit.web.id
 *
 * Copyright (c) 2021 MDVK, LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */
mixin ExDialog {
  /// type : single input
  static void singleInput({
    required String title,
    TextStyle? titleTextStyle,
    String? body,
    TextStyle? bodyStyle,
    //
    String? initialValue,
    double width = 300,
    bool isDismissible = true,
    String hint = '',
    String btnYesText = 'OK',
    String btnNoText = 'Cancel',
    Color? barrierColor = Colors.black54,
    double cornerRadius = 12,
    Function(String)? onYes,
    Function()? onNo,
  }) {
    final isInputValid = false.obs;
    final tfController = TextEditingController(text: initialValue);

    showDialog(
      context: Get.context!,
      barrierDismissible: isDismissible,
      barrierColor: barrierColor,
      builder: (context) {
        HapticFeedback.lightImpact();
        return SizedBox(
          width: width,
          child: AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(cornerRadius))),
            contentPadding: EdgeInsets.all(0),
            scrollable: true,
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// title
                Text(
                  title,
                  style: titleTextStyle ?? TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 16),
                  maxLines: 2,
                ).p16(),
                12.heightBox,
                if (body != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      body,
                      textAlign: TextAlign.start,
                      style: bodyStyle ?? TextStyle(fontSize: 14, color: Vx.neutral500),
                    ),
                  ),
                12.heightBox,
                ExTextField(
                  controller: tfController,
                  borderColor: Vx.neutral300,
                  hint: hint,
                  borderRadius: 4,
                  fillColor: Vx.neutral50,
                  onChanged: (s) => isInputValid.value = s.isNotBlank,
                ).pSymmetric(h: 12, v: 12),

                Divider().pSymmetric(v: 16),

                // action
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ExButtonText(
                      label: '$btnNoText',
                      labelColor: Colors.black,
                      onPressed: onNo ?? Get.back,
                    ).pOnly(right: 12, bottom: 12).h(55).pOnly(right: 8),
                    Obx(
                      () => ExButtonElevated(
                        minimumSize: Size(70, 55),
                        label: '$btnYesText',
                        onPressed: isInputValid.value == true
                            ? () {
                                Get.back();
                                onYes?.call(tfController.text);
                              }
                            : null,
                      ).pOnly(right: 12, bottom: 12).h(55),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static void custom({
    required String title,
    double width = 300,
    double titleTextSize = 18,
    TextStyle? titleTextStyle,
    bool isDismissible = true,
    Color? barrierColor = Colors.black54,
    double cornerRadius = 12,
    Widget? content,
  }) {
    showDialog(
      context: Get.context!,
      barrierDismissible: isDismissible,
      barrierColor: barrierColor,
      builder: (context) {
        HapticFeedback.lightImpact();
        return SizedBox(
          width: width,
          child: AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(cornerRadius)),
            ),
            contentPadding: EdgeInsets.all(0),
            scrollable: true,
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// title
                Text(
                  title,
                  style: titleTextStyle ?? TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 16),
                  maxLines: 2,
                ).p16(),
                if (content != null)
                  Padding(
                    padding: EdgeInsets.all(12),
                    child: content,
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
