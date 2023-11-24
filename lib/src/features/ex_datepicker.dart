import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../ex.dart';

mixin ExDatePicker {
  // —————————————————————————————————————————————————————————————————————————
  // DATE PICKER (CUPERTINO) —————————————————————————————————————————————————
  // —————————————————————————————————————————————————————————————————————————
  static void cupertinoDatePicker({
    required Function(DateTime) callback,
    String title = 'Select Date',
    String btnOKText = 'Select',
    String btnCancelText = 'Cancel',
    DateTime? initialDate,
    DateTime? minDate,
    DateTime? maxDate,
    CupertinoDatePickerMode mode = CupertinoDatePickerMode.date,
  }) {
    var output = DateTime.now();
    showCupertinoModalPopup(
      context: Get.context!,
      builder: (_) => CupertinoApp(
        debugShowCheckedModeBanner: false,
        builder: (context, child) => Container(
          height: Get.size.height * 0.50,
          decoration: ExDecorator.top(),
          child: Column(
            children: [
              ExDashLine().pOnly(top: 12),
              HStack([
                title.text
                    .size(14)
                    .color(Get.theme.textTheme.displayMedium?.color)
                    .fontWeight(FontWeight.w500)
                    .make()
                    .expand(),
              ]).pOnly(left: 20, top: 12, bottom: 12),
              Divider(),
              CupertinoTheme(
                data: CupertinoThemeData(
                  brightness:
                      Get.isDarkMode ? Brightness.dark : Brightness.light,
                  textTheme: CupertinoTextThemeData(
                    dateTimePickerTextStyle: TextStyle(
                      color: Get.theme.textTheme.bodyLarge?.color,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
                child: CupertinoDatePicker(
                  minimumYear: 1980,
                  maximumYear: 2050,
                  mode: mode,
                  initialDateTime: initialDate ?? DateTime.now(),
                  minimumDate: minDate ?? DateTime.now().subtract(1.seconds),
                  maximumDate: maxDate?.add(1.minutes) ?? DateTime(2050),
                  dateOrder: DatePickerDateOrder.dmy,
                  onDateTimeChanged: (val) => output = val,
                  use24hFormat: true,
                ).w(double.infinity),
              ).expand(),
              HStack(
                [
                  ExButtonElevated(
                    width: double.infinity,
                    radius: 0,
                    backgroundColor: Get.theme.canvasColor,
                    label: btnCancelText,
                    labelColor: Vx.red500,
                    onPressed: Get.back,
                  ).expand(),
                  1.widthBox,
                  ExButtonElevated(
                    width: double.infinity,
                    radius: 0,
                    backgroundColor: Get.theme.canvasColor,
                    label: btnOKText,
                    labelColor: Get.theme.textTheme.displayLarge?.color,
                    onPressed: () {
                      callback.call(output);
                      Navigator.of(Get.context!).pop();
                    },
                  ).expand(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  static void cupertinoTimePicker({
    required Function(DateTime) callback,
    String title = 'Select Time',
    String btnOKText = 'Select',
    String btnCancelText = 'Cancel',
    DateTime? initialDate,
    DateTime? minDate,
    DateTime? maxDate,
    CupertinoDatePickerMode mode = CupertinoDatePickerMode.date,
  }) {
    var output = DateTime.now();
    showCupertinoModalPopup(
      context: Get.context!,
      builder: (_) => CupertinoApp(
        debugShowCheckedModeBanner: false,
        builder: (context, child) => Container(
          height: Get.size.height * 0.40,
          decoration: ExDecorator.top(),
          child: Column(
            children: [
              ExDashLine().pOnly(top: 12),
              HStack([
                title.text
                    .size(14)
                    .color(Get.theme.textTheme.displayMedium?.color)
                    .fontWeight(FontWeight.w500)
                    .make()
                    .expand(),
              ]).pOnly(left: 20, top: 12, bottom: 12),
              Divider(),
              CupertinoTheme(
                data: CupertinoThemeData(
                  brightness:
                      Get.isDarkMode ? Brightness.dark : Brightness.light,
                  textTheme: CupertinoTextThemeData(
                    dateTimePickerTextStyle: TextStyle(
                      color: Get.theme.textTheme.bodyLarge?.color,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.time,
                  initialDateTime: initialDate ?? DateTime.now(),
                  minimumDate: minDate ?? DateTime.now().subtract(1.seconds),
                  // somehow must like this =,=
                  maximumDate: maxDate?.add(1.minutes) ?? DateTime(2050),
                  onDateTimeChanged: (val) => output = val,
                  dateOrder: DatePickerDateOrder.dmy,
                ),
              ).expand(),
              HStack(
                [
                  ExButtonElevated(
                    width: double.infinity,
                    radius: 0,
                    backgroundColor: Get.theme.canvasColor,
                    label: btnCancelText,
                    labelColor: Vx.red500,
                    onPressed: Get.back,
                  ).expand(),
                  1.widthBox,
                  ExButtonElevated(
                    width: double.infinity,
                    radius: 0,
                    backgroundColor: Get.theme.canvasColor,
                    label: btnOKText,
                    labelColor: Get.theme.textTheme.displayLarge?.color,
                    onPressed: () {
                      callback.call(output);
                      Navigator.of(Get.context!).pop();
                    },
                  ).expand(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

// —————————————————————————————————————————————————————————————————————————
// DATE PICKER (MATERIAL) ——————————————————————————————————————————————————
// —————————————————————————————————————————————————————————————————————————
  static Future<void> materialDatePicker({
    required Function(DateTime) callback,
    DateTime? initialDate,
    DateTime? minDate,
    DateTime? maxDate,
  }) async {
    final picked = await showDatePicker(
      context: Get.context!,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: minDate ?? DateTime(2020),
      lastDate: maxDate ?? DateTime(2050),
    );
    if (picked != null) {
      callback.call(picked);
    }
  }

  static Future<void> materialTimePicker({
    required Function(TimeOfDay) callback,
    DateTime? initialDate,
    DateTime? minDate,
    DateTime? maxDate,
  }) async {
    final picked = await showTimePicker(
      context: Get.context!,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      callback.call(picked);
    }
  }

// ------------------------------------------------------------------------
// ADAPTIVE DATE PICKER
// ------------------------------------------------------------------------
  static Future<void> adaptiveDatePicker({
    required Function(DateTime) callback,
    DateTime? initialDate,
    DateTime? minDate,
    DateTime? maxDate,
  }) async {
    if (Platform.isAndroid) {
      await materialDatePicker(
        initialDate: initialDate,
        minDate: minDate,
        maxDate: maxDate,
        callback: callback,
      );
    } else {
      cupertinoDatePicker(
        initialDate: initialDate,
        minDate: minDate,
        maxDate: maxDate,
        callback: callback,
      );
    }
  }

// ------------------------------------------------------------------------
// ADAPTIVE TIME PICKER
// ------------------------------------------------------------------------
  static Future<void> adaptiveTimePicker({
    required Function(dynamic) callback,
    DateTime? initialDate,
    DateTime? minDate,
    DateTime? maxDate,
  }) async {
    if (Platform.isAndroid) {
      await materialTimePicker(
        initialDate: initialDate,
        minDate: minDate,
        maxDate: maxDate,
        callback: callback,
      );
    } else {
      cupertinoTimePicker(
        initialDate: initialDate,
        minDate: minDate,
        maxDate: maxDate,
        callback: callback,
      );
    }
  }

  static Future<void> cupertinoDatetimePicker({
    required Function(dynamic) callback,
    DateTime? initialDate,
    DateTime? minDate,
    DateTime? maxDate,
  }) async {
    cupertinoDatePicker(
      initialDate: initialDate,
      minDate: minDate,
      maxDate: maxDate,
      callback: callback,
      mode: CupertinoDatePickerMode.dateAndTime,
    );
  }
}
