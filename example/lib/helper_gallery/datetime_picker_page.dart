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
          '# DATE'.text.bodyText1(context).bold.make().pOnly(bottom: 12),
          Wrap(
            children: [
              ExButtonOutline(
                label: 'material',
                onPressed: () => ExDatePicker.datePickerMaterial(
                  context,
                  minDate: DateTime(1990),
                  maxDate: DateTime.now(),
                  callback: (p0) => ExSnackbar.info(context, '$p0'),
                ),
              ).pOnly(right: 8),
              ExButtonOutline(
                label: 'cupertino',
                onPressed: () => ExDatePicker.datePickerCupertino(
                  context,
                  minDate: DateTime(1990),
                  maxDate: DateTime(2040),
                  callback: (p0) => ExSnackbar.info(context, '$p0'),
                ),
              ).pOnly(right: 8),
              ExButtonOutline(
                label: 'adaptive',
                onPressed: () => ExDatePicker.date(
                  context,
                  minDate: DateTime(1990),
                  callback: (p0) => ExSnackbar.info(context, '$p0'),
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
                  context,
                  minDate: DateTime(1990),
                  callback: (p0) => ExSnackbar.info(context, '$p0'),
                ),
              ).pOnly(right: 8),
              ExButtonOutline(
                label: 'cupertino',
                onPressed: () => ExDatePicker.timePickerCupertino(
                  context,
                  minDate: DateTime(1990),
                  callback: (p0) => ExSnackbar.info(context, '$p0'),
                ),
              ).pOnly(right: 8),
              ExButtonOutline(
                label: 'adaptive',
                onPressed: () => ExDatePicker.time(
                  context,
                  minDate: DateTime(1990),
                  callback: (p0) => ExSnackbar.info(context, '$p0'),
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
                  context,
                  // minDate: DateTime(1990),
                  callback: (p0) => ExSnackbar.info(context, '$p0'),
                ),
              ).pOnly(right: 8),
            ],
          ),
        ],
      ).p12(),
    );
  }
}
