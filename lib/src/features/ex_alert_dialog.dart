// ignore_for_file: non_constant_identifier_names

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:velocity_x/velocity_x.dart';

/*
 * ExAlert
 * Created by Aditya Pratama
 * https://adit.web.id
 *
 * Copyright (c) 2021 MDVK, LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */
mixin ExAlert {
  /// -- example implementation --
  /// ```dart
  /// ExAlert.success(
  ///   context: context,
  ///   title: 'Hello World',
  ///   message: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
  ///   onYes: () => print('clicked'),
  /// );
  /// ```
  static void success({
    required BuildContext context,
    String svgAssetDir = 'assets/images/ic_dialog_success.svg',
    String title = 'Sukses',
    required String message,
    bool isDismissible = false,
    String btnYesText = 'Selesai',
    Function()? onYes,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          // shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
          // contentPadding: EdgeInsets.all(16),
          scrollable: true,
          content: VStack([
            SvgPicture.asset(svgAssetDir, package: 'ex', width: 90, height: 90).centered(),
            24.heightBox,
            Center(
              child: Text(
                title,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
                maxLines: 2,
              ),
            ),
            12.heightBox,
            Center(
              child: Text(
                message,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.blueGrey),
                textAlign: TextAlign.center,
              ),
            ),
          ]),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Theme.of(context).primaryColor),
                  onPressed: onYes ?? () => Navigator.of(context).pop(),
                  child: Text(btnYesText),
                ).pOnly(left: 12, right: 12, bottom: 12).h(55).expand(),
              ],
            ),
          ],
        );
      },
    );
  }

  /// -- example implementation --
  /// ```dart
  /// ExAlert.error(
  ///   context: context,
  ///   title: 'Failed :"))',
  ///   message: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
  ///   onYes: () => print('clicked'),
  /// );
  /// ```
  static void error({
    required BuildContext context,
    String svgAssetDir = 'assets/images/ic_dialog_error.svg',
    String title = 'Gagal',
    required String message,
    bool isDismissible = false,
    String btnYesText = 'Tutup',
    Function()? onYes,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          // shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
          // contentPadding: EdgeInsets.all(16),
          scrollable: true,
          content: VStack([
            SvgPicture.asset(svgAssetDir, package: 'ex', width: 90, height: 90).centered(),
            24.heightBox,
            Center(
              child: Text(
                title,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
                maxLines: 2,
              ),
            ),
            12.heightBox,
            Center(
              child: Text(
                message,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.blueGrey),
                textAlign: TextAlign.center,
              ),
            ),
          ]),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Theme.of(context).errorColor),
                  onPressed: onYes ?? () => Navigator.of(context).pop(),
                  child: Text(btnYesText),
                ).pOnly(left: 12, right: 12, bottom: 12).h(55).expand(),
              ],
            ),
          ],
        );
      },
    );
  }

  /// -- example implementation --
  /// ```dart
  /// ExAlert.confirm(
  ///   context: context,
  ///   title: 'Some Question',
  ///   message: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry?',
  ///   onYes: () => print('yes clicked'),
  ///   onNo: () => print('no clicked'),
  /// );
  /// ```
  static void confirm({
    required BuildContext context,
    required String title,
    required String message,
    bool isDismissible = false,
    String btnNoText = 'Tidak',
    Function()? onNo,
    String btnYesText = 'Ya',
    Function()? onYes,
    bool isWarningMode = false,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          // shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
          // contentPadding: EdgeInsets.all(16),
          scrollable: true,
          content: VStack([
            Text(
              title,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              maxLines: 2,
            ),
            12.heightBox,
            Text(
              message,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.blueGrey),
            ),
          ]),
          actions: [
            Row(
              children: [
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    primary: isWarningMode == true ? Theme.of(context).errorColor : Theme.of(context).primaryColor,
                    side: BorderSide(color: isWarningMode == true ? Theme.of(context).errorColor : Theme.of(context).primaryColor),
                  ),
                  onPressed: onNo ?? () => Navigator.of(context).pop(),
                  child: Text(btnNoText),
                ).pOnly(bottom: 12).h(55).expand(),
                8.widthBox,
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: isWarningMode == true ? Theme.of(context).errorColor : Theme.of(context).primaryColor),
                  onPressed: onYes ?? () => Navigator.of(context).pop(),
                  child: Text(btnYesText),
                ).pOnly(bottom: 12).h(55).expand(),
              ],
            ).pOnly(left: 12, right: 12),
          ],
        );
      },
    );
  }
}
