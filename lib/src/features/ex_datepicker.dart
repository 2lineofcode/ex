import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../ex.dart';

mixin ExDatePicker {
  // —————————————————————————————————————————————————————————————————————————
  // DATE PICKER (CUPERTINO) —————————————————————————————————————————————————
  // —————————————————————————————————————————————————————————————————————————
  static void datePickerCupertino({
    required Function(DateTime) callback,
    String title = 'Pilih Tanggal',
    String btnText = 'Simpan',
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
          // color: colorPrimary[300],
          decoration: ExDecorator.boxBottomSheet(),
          child: Column(
            children: [
              HStack([
                title.text.size(18).bold.black.make(),
                Spacer(),
              ]).pOnly(left: 16, top: 16, bottom: 8),
              Divider(),
              CupertinoTheme(
                data: CupertinoThemeData(brightness: Brightness.light),
                child: CupertinoDatePicker(
                  mode: mode,
                  initialDateTime: initialDate ?? DateTime.now(),
                  minimumDate: minDate ?? DateTime.now().subtract(1.seconds),
                  // somehow must like this =,=
                  maximumDate: maxDate?.add(1.minutes) ?? DateTime(2050),
                  onDateTimeChanged: (val) => output = val,
                  dateOrder: DatePickerDateOrder.dmy,
                ),
              ).expand(),
              ExButtonElevated(
                width: double.infinity,
                label: btnText,
                onPressed: () {
                  callback.call(output);
                  Navigator.of(Get.context!).pop();
                },
              ).pSymmetric(h: 24).pOnly(bottom: 24),
            ],
          ),
        ),
      ),
    );
  }

  static void timePickerCupertino({
    required Function(DateTime) callback,
    DateTime? initialDate,
    DateTime? minDate,
    DateTime? maxDate,
  }) {
    var output = DateTime.now();
    showCupertinoModalPopup(
      context: Get.context!,
      builder: (_) => Container(
        height: 270,
        color: const Color.fromARGB(255, 255, 255, 255),
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.time,
                initialDateTime: initialDate ?? DateTime.now(),
                minimumDate: minDate ?? DateTime.now().subtract(1.seconds),
                // somehow must like this =,=
                maximumDate: maxDate ?? DateTime(2050),
                onDateTimeChanged: (val) => output = val,

                use24hFormat: true,
              ),
            ),
            // Close the modal
            CupertinoButton(
              child: const Text('OK'),
              onPressed: () {
                callback.call(output);
                Navigator.of(Get.context!).pop();
              },
            )
          ],
        ),
      ),
    );
  }

// —————————————————————————————————————————————————————————————————————————
// DATE PICKER (MATERIAL) ——————————————————————————————————————————————————
// —————————————————————————————————————————————————————————————————————————
  static Future<void> datePickerMaterial({
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

  static Future<void> timePickerMaterial({
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

  static Future<void> date({
    required Function(DateTime) callback,
    DateTime? initialDate,
    DateTime? minDate,
    DateTime? maxDate,
  }) async {
    if (Platform.isAndroid) {
      await datePickerMaterial(
        initialDate: initialDate,
        minDate: minDate,
        maxDate: maxDate,
        callback: callback,
      );
    } else {
      datePickerCupertino(
        initialDate: initialDate,
        minDate: minDate,
        maxDate: maxDate,
        callback: callback,
      );
    }
  }

  static Future<void> time({
    required Function(dynamic) callback,
    DateTime? initialDate,
    DateTime? minDate,
    DateTime? maxDate,
  }) async {
    if (Platform.isAndroid) {
      await timePickerMaterial(
        initialDate: initialDate,
        minDate: minDate,
        maxDate: maxDate,
        callback: callback,
      );
    } else {
      timePickerCupertino(
        initialDate: initialDate,
        minDate: minDate,
        maxDate: maxDate,
        callback: callback,
      );
    }
  }

  static Future<void> datetime({
    required Function(dynamic) callback,
    DateTime? initialDate,
    DateTime? minDate,
    DateTime? maxDate,
  }) async {
    datePickerCupertino(
      initialDate: initialDate,
      minDate: minDate,
      maxDate: maxDate,
      callback: callback,
      mode: CupertinoDatePickerMode.dateAndTime,
    );
    // if (Platform.isAndroid) {
    //   await datePickerMaterial(
    //     initialDate: initialDate,
    //     minDate: minDate,
    //     maxDate: maxDate,
    //     callback: callback,
    //   );
    // } else {
    //   datePickerCupertino(
    //     initialDate: initialDate,
    //     minDate: minDate,
    //     maxDate: maxDate,
    //     callback: callback,
    //   );
    // }
  }
}
