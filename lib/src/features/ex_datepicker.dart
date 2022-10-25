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
    DateTime? initialDate,
    DateTime? minDate,
    DateTime? maxDate,
    required Function(DateTime) callback,
    CupertinoDatePickerMode mode = CupertinoDatePickerMode.date,
  }) {
    var output = DateTime.now();
    showCupertinoModalPopup(
      context: Get.context!,
      builder: (_) => Container(
        height: 270,
        decoration: ExDecorator.boxBottomSheet(),
        child: Column(
          children: [
            HStack([
              // 'Select Date'.text.size(16).bold.make(),
              Spacer(),
              CupertinoButton(
                child: 'Apply'.text.make(),
                onPressed: () {
                  callback.call(output);
                  Get.back();
                },
              ),
            ]).pSymmetric(h: 16, v: 2),
            SizedBox(
              height: 200,
              child: CupertinoDatePicker(
                mode: mode,
                initialDateTime: initialDate ?? DateTime.now(),
                minimumDate: minDate ?? DateTime.now().subtract(1.seconds),
                maximumDate: maxDate ?? DateTime(2050),
                onDateTimeChanged: (val) => output = val,
                use24hFormat: true,
              ),
            ),
          ],
        ),
      ),
    );
  }

  static void timePickerCupertino({
    DateTime? initialDate,
    DateTime? minDate,
    DateTime? maxDate,
    required Function(DateTime) callback,
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
    DateTime? initialDate,
    DateTime? minDate,
    DateTime? maxDate,
    required Function(DateTime) callback,
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
    DateTime? initialDate,
    DateTime? minDate,
    DateTime? maxDate,
    required Function(TimeOfDay) callback,
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
    DateTime? initialDate,
    DateTime? minDate,
    DateTime? maxDate,
    required Function(DateTime) callback,
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
    DateTime? initialDate,
    DateTime? minDate,
    DateTime? maxDate,
    required Function(dynamic) callback,
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
    DateTime? initialDate,
    DateTime? minDate,
    DateTime? maxDate,
    required Function(dynamic) callback,
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
