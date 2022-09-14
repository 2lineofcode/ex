import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

/*
 * ExAlert
 * Created by Aditya Pratama
 * https://adit.web.id
 *
 * Copyright (c) 2021 MDVK, LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */
mixin ExInputDialog {
  // type : single input
  static void single({
    required String title,
    required String questionText,
    required String helperText,
    String? initialValue,
    double height = 250,
    double width = 300,
    double titleTextSize = 18,
    bool isDismissible = true,
    String inputHint = 'example',
    String btnOkText = 'Simpan',
    String btnCancelText = 'Batal',
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
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(cornerRadius))),
          contentPadding: EdgeInsets.all(0),
          content: SizedBox(
            height: height,
            width: width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Color(0xFFF6F7F9),
                  height: 56,
                  width: width,
                  child: HStack(
                    [title.text.size(20).bold.make().pSymmetric(h: 24)],
                  ),
                ).cornerRadius(4),
                24.heightBox,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    questionText,
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 12, color: Color(0xFF676E76)),
                  ),
                ),
                VxTextField(
                  controller: tfController,
                  borderType: VxTextFieldBorderType.roundLine,
                  borderRadius: 4,
                  borderColor: Color(0xFF676E76),
                  fillColor: Colors.white,
                  contentPaddingLeft: 8,
                  contentPaddingTop: 8,
                  onChanged: (s) => isInputValid.value = s.isNotBlank,
                ).pSymmetric(h: 12, v: 12),
                Text(
                  helperText,
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 12, color: Color(0xFF676E76)),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ).pSymmetric(h: 12),
                8.heightBox,
                Divider(),
              ],
            ),
          ),
          actions: [
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
                    style: ElevatedButton.styleFrom(backgroundColor: Theme.of(context).primaryColor),
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
        );
      },
    );
  }
}
