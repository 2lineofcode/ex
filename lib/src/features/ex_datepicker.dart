import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../ex.dart';

mixin ExDatePicker {
  // —————————————————————————————————————————————————————————————————————————
  // DATE PICKER (CUPERTINO) —————————————————————————————————————————————————
  // —————————————————————————————————————————————————————————————————————————
  static void datePickerCupertino(
    BuildContext context, {
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
      context: context,
      builder: (_) => CupertinoApp(
        debugShowCheckedModeBanner: false,
        builder: (context, child) => Container(
          height: MediaQuery.of(context).size.height * 0.40,
          decoration: ExDecorator.top(),
          child: Column(
            children: [
              ExDashLine().pOnly(top: 12),
              HStack([
                title.text.size(16).black.fontWeight(FontWeight.w500).make().expand(),
                ExButtonOutline(
                  label: btnOKText,
                  height: 36,
                  labelColor: Theme.of(context).primaryColor,
                  backgroundColor: Vx.neutral100,
                  borderColor: Colors.transparent,
                  onPressed: () {
                    callback.call(output);
                    Navigator.of(context).pop();
                  },
                ).pOnly(right: 12),
              ]).pOnly(left: 20, top: 12, bottom: 12),
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
            ],
          ),
        ),
      ),
    );
  }

  static void timePickerCupertino(
    BuildContext context, {
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
      context: context,
      builder: (_) => CupertinoApp(
        debugShowCheckedModeBanner: false,
        builder: (context, child) => Container(
          height: MediaQuery.of(context).size.height * 0.40,
          decoration: ExDecorator.top(),
          child: Column(
            children: [
              ExDashLine().pOnly(top: 12),
              HStack([
                title.text.size(16).black.fontWeight(FontWeight.w500).make().expand(),
                ExButtonOutline(
                  label: btnOKText,
                  labelColor: Theme.of(context).primaryColor,
                  height: 36,
                  backgroundColor: Vx.neutral100,
                  borderColor: Colors.transparent,
                  onPressed: () {
                    callback.call(output);
                    Navigator.of(context).pop();
                  },
                ).pOnly(right: 12),
              ]).pOnly(left: 20, top: 12, bottom: 12),
              Divider(),
              CupertinoTheme(
                data: CupertinoThemeData(brightness: Brightness.light),
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
            ],
          ),
        ),
      ),
    );
  }

// —————————————————————————————————————————————————————————————————————————
// DATE PICKER (MATERIAL) ——————————————————————————————————————————————————
// —————————————————————————————————————————————————————————————————————————
  static Future<void> datePickerMaterial(
    BuildContext context, {
    required Function(DateTime) callback,
    DateTime? initialDate,
    DateTime? minDate,
    DateTime? maxDate,
  }) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: minDate ?? DateTime(2020),
      lastDate: maxDate ?? DateTime(2050),
    );
    if (picked != null) {
      callback.call(picked);
    }
  }

  static Future<void> timePickerMaterial(
    BuildContext context, {
    required Function(TimeOfDay) callback,
    DateTime? initialDate,
    DateTime? minDate,
    DateTime? maxDate,
  }) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      callback.call(picked);
    }
  }

  static Future<void> date(
    BuildContext context, {
    required Function(DateTime) callback,
    DateTime? initialDate,
    DateTime? minDate,
    DateTime? maxDate,
  }) async {
    if (Platform.isAndroid) {
      await datePickerMaterial(
        context,
        initialDate: initialDate,
        minDate: minDate,
        maxDate: maxDate,
        callback: callback,
      );
    } else {
      datePickerCupertino(
        context,
        initialDate: initialDate,
        minDate: minDate,
        maxDate: maxDate,
        callback: callback,
      );
    }
  }

  static Future<void> time(
    BuildContext context, {
    required Function(dynamic) callback,
    DateTime? initialDate,
    DateTime? minDate,
    DateTime? maxDate,
  }) async {
    if (Platform.isAndroid) {
      await timePickerMaterial(
        context,
        initialDate: initialDate,
        minDate: minDate,
        maxDate: maxDate,
        callback: callback,
      );
    } else {
      timePickerCupertino(
        context,
        initialDate: initialDate,
        minDate: minDate,
        maxDate: maxDate,
        callback: callback,
      );
    }
  }

  static Future<void> datetime(
    BuildContext context, {
    required Function(dynamic) callback,
    DateTime? initialDate,
    DateTime? minDate,
    DateTime? maxDate,
  }) async {
    datePickerCupertino(
      context,
      initialDate: initialDate,
      minDate: minDate,
      maxDate: maxDate,
      callback: callback,
      mode: CupertinoDatePickerMode.dateAndTime,
    );
  }
}
