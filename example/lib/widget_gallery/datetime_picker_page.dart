import 'package:ex/ex.dart';
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
          '# DATE'.text.bodyText1(context).bold.make().pOnly(bottom: 12),
          Wrap(
            children: [
              ExButtonOutline(
                label: 'material',
                onPressed: () => ExDatePicker.datePickerMaterial(
                  minDate: DateTime(1990),
                  callback: (p0) => ExSnackbar.info('$p0'),
                ),
              ).pOnly(right: 8),
              ExButtonOutline(
                label: 'cupertino',
                onPressed: () => ExDatePicker.datePickerCupertino(
                  minDate: DateTime(1990),
                  callback: (p0) => ExSnackbar.info('$p0'),
                ),
              ).pOnly(right: 8),
              ExButtonOutline(
                label: 'adaptive',
                onPressed: () => ExDatePicker.date(
                  minDate: DateTime(1990),
                  callback: (p0) => ExSnackbar.info('$p0'),
                ),
              ).pOnly(right: 8),
            ],
          ),

          Divider().pSymmetric(v: 10),

          /// 2
          '# TIME'.text.bodyText1(context).bold.make().pOnly(bottom: 12),
          Wrap(
            children: [
              ExButtonOutline(
                label: 'material',
                onPressed: () => ExDatePicker.timePickerMaterial(
                  minDate: DateTime(1990),
                  callback: (p0) => ExSnackbar.info('$p0'),
                ),
              ).pOnly(right: 8),
              ExButtonOutline(
                label: 'cupertino',
                onPressed: () => ExDatePicker.timePickerCupertino(
                  minDate: DateTime(1990),
                  callback: (p0) => ExSnackbar.info('$p0'),
                ),
              ).pOnly(right: 8),
              ExButtonOutline(
                label: 'adaptive',
                onPressed: () => ExDatePicker.time(
                  minDate: DateTime(1990),
                  callback: (p0) => ExSnackbar.info('$p0'),
                ),
              ).pOnly(right: 8),
            ],
          ),

          Divider().pSymmetric(v: 10),

          /// 3
          '# DATETIME'.text.bodyText1(context).bold.make().pOnly(bottom: 12),
          Wrap(
            children: [
              ExButtonOutline(
                label: 'cupertino',
                onPressed: () => ExDatePicker.datetime(
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
