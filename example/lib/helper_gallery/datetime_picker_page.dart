import 'package:ex_kit/ex.dart';
import 'package:flutter/material.dart';

class DateTimePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 'DateTime Picker'.text.extraBold.size(16).make(),
      ),
      body: VStack(
        [
          /// 1
          '# DATE'.text.bold.make().pOnly(bottom: 12),
          Wrap(
            children: [
              ExButtonOutline(
                label: 'material',
                onPressed: () => ExDatePicker.materialDatePicker(
                  minDate: DateTime(1990),
                  maxDate: DateTime.now(),
                  callback: (p0) => ExSnackbar.info('$p0'),
                ),
              ).pOnly(right: 8),
              ExButtonOutline(
                label: 'cupertino',
                onPressed: () => ExDatePicker.cupertinoDatePicker(
                  minDate: DateTime(1990),
                  maxDate: DateTime(2040),
                  callback: (p0) => ExSnackbar.info('$p0'),
                ),
              ).pOnly(right: 8),
              ExButtonOutline(
                label: 'adaptive',
                onPressed: () => ExDatePicker.adaptiveDatePicker(
                  minDate: DateTime(1990),
                  callback: (p0) => ExSnackbar.info('$p0'),
                ),
              ).pOnly(right: 8),
            ],
          ),

          Divider().pSymmetric(v: 10),

          /// 2
          '# TIME'.text.bold.make().pOnly(bottom: 12),
          Wrap(
            children: [
              ExButtonOutline(
                label: 'material',
                onPressed: () => ExDatePicker.materialTimePicker(
                  minDate: DateTime(1990),
                  callback: (p0) => ExSnackbar.info('$p0'),
                ),
              ).pOnly(right: 8),
              ExButtonOutline(
                label: 'cupertino',
                onPressed: () => ExDatePicker.cupertinoTimePicker(
                  minDate: DateTime(1990),
                  callback: (p0) => ExSnackbar.info('$p0'),
                ),
              ).pOnly(right: 8),
              ExButtonOutline(
                label: 'adaptive',
                onPressed: () => ExDatePicker.adaptiveTimePicker(
                  minDate: DateTime(1990),
                  callback: (p0) => ExSnackbar.info('$p0'),
                ),
              ).pOnly(right: 8),
            ],
          ),

          Divider().pSymmetric(v: 10),

          /// 3
          '# DATETIME'.text.bold.make().pOnly(bottom: 12),
          Wrap(
            children: [
              ExButtonOutline(
                label: 'cupertino',
                onPressed: () => ExDatePicker.cupertinoDatetimePicker(
                  // minDate: DateTime(1990),
                  callback: (p0) => ExSnackbar.info('$p0'),
                ),
              ).pOnly(right: 8),
            ],
          ),
        ],
      ).p12(),
    );
  }
}
