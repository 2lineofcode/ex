// ignore_for_file: deprecated_member_use

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
mixin ExDialog {
  /// type : single input
  static void singleInput({
    required String title,
    String? questionText,
    String? helperText,
    String? initialValue,
    //
    TextStyle? titleTextStyle,
    TextStyle? questionTextStyle,
    TextStyle? helperTextStyle,

    // double height = 250,
    double width = 300,
    double titleTextSize = 18,
    bool isDismissible = true,
    String inputHint = '',
    String btnOkText = 'Yes',
    String btnCancelText = 'No',
    Color? barrierColor = Colors.black54,
    double cornerRadius = 4,
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
        return SizedBox(
          width: width,
          child: AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(cornerRadius))),
            contentPadding: EdgeInsets.all(0),
            scrollable: true,
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Color(0xFFF6F7F9),
                  height: 48,
                  width: width,
                  child: HStack(
                    [
                      title.text.size(titleTextSize).ellipsis.textStyle(titleTextStyle ?? TextStyle()).maxLines(1).bold.make().pSymmetric(h: 24).expand(),
                    ],
                  ),
                ).cornerRadius(4),
                24.heightBox,
                if (questionText != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      questionText,
                      textAlign: TextAlign.start,
                      style: questionTextStyle ?? TextStyle(fontSize: 12, color: colorNeutral),
                    ),
                  ),
                ExTextField(
                  tfController: tfController,
                  borderColor: colorNeutral[300],
                  hint: inputHint,
                  onChanged: (s) => isInputValid.value = s.isNotBlank,
                ).pSymmetric(h: 12, v: 12),
                if (helperText != null)
                  Text(
                    helperText,
                    textAlign: TextAlign.start,
                    style: helperTextStyle ?? TextStyle(fontSize: 12, color: colorNeutral),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ).pSymmetric(h: 12),
                Divider().pSymmetric(v: 16),

                // action
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    OutlinedButton(
                      onPressed: onNo ?? () => Get.back(),
                      child: Text(
                        btnCancelText,
                        style: TextStyle(color: Colors.black),
                      ),
                    ).pOnly(right: 12, bottom: 12).h(55),
                    Obx(
                      () => ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Theme.of(context).primaryColor),
                        onPressed: isInputValid.value == true
                            ? () {
                                if (tfController.text.isNotBlank) {
                                  Get.back();
                                  onYes?.call(tfController.text);
                                } else {
                                  Get.snackbar(
                                    'Gagal',
                                    'Field tidak boleh kosong',
                                    backgroundColor: Theme.of(context).errorColor,
                                    colorText: Colors.white,
                                    duration: 900.milliseconds,
                                    animationDuration: 100.milliseconds,
                                  );
                                }
                              }
                            : null,
                        child: Text(btnOkText),
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
    double cornerRadius = 4,
    Widget? content,
  }) {
    showDialog(
      context: Get.context!,
      barrierDismissible: isDismissible,
      barrierColor: barrierColor,
      builder: (context) {
        return SizedBox(
          width: width,
          child: AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(cornerRadius))),
            contentPadding: EdgeInsets.all(0),
            scrollable: true,
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Color(0xFFF6F7F9),
                  height: 48,
                  width: width,
                  child: HStack(
                    [
                      title.text.size(titleTextSize).ellipsis.textStyle(titleTextStyle ?? TextStyle()).maxLines(1).bold.make().pSymmetric(h: 24).expand(),
                    ],
                  ),
                ).cornerRadius(4),
                if (content != null) content.p12()
              ],
            ),
          ),
        );
      },
    );
  }
}
