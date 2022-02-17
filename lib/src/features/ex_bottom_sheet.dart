// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../ex.dart';
import '_key_val.dart';

/*
 * ExBottomSheet
 * Created by Aditya Pratama
 * https://adit.web.id
 *
 * Copyright (c) 2021 MDVK, LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */
mixin ExBottomSheet {
  /// -- example implementation --
  /// ```dart
  /// ExBottomSheet.custom(
  ///       context: context,
  ///       title: 'Custom Example',
  ///       body: VStack([
  ///         'this is body'.text.make(),
  ///       ]),
  ///       footer: HStack([
  ///         'this is footer'.text.make(),
  ///       ]),
  ///  );
  /// ```
  static void custom({
    required BuildContext context,
    required String title,
    Widget? body,
    Widget? footer,
  }) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      backgroundColor: Colors.white,
      enableDrag: true,
      barrierColor: Color(0x96000000),
      builder: (context) => Material(
        child: VStack([
          ExDashLine(),
          16.heightBox,
          HStack([
            title.text.size(22).bold.maxLines(1).overflow(TextOverflow.ellipsis).make().expand(),
          ]),
          Expanded(
            child: VStack([
              if (body != null)
                VStack([
                  24.heightBox,
                  body,
                ]),
            ]).scrollVertical(),
          ),
          if (footer != null)
            VStack([
              24.heightBox,
              footer,
            ]),
        ]).p24(),
      ),
    );
  }

  /// -- example implementation --
  /// ```dart
  /// final _data = <KeyVal>[];
  /// repeat(2, (index) {
  ///   _data.add(KeyVal(key: 'key$index', val: 'val$index'));
  /// });
  /// ExBottomSheet.list(
  ///   context: context,
  ///   title: 'List Example',
  ///   data: _data,
  ///   callback: (k, v) {
  ///     ExAlertSuccess(context: Get.context!, message: 'data dengan key $k dipilih');
  ///   },
  /// );
  /// ```
  static void list({
    required BuildContext context,
    String title = '',
    double titleTextSize = 22,
    required List<KeyVal> data,
    double dataTextSize = 14,
    Color dataTextColor = Colors.black,
    required Function(dynamic, dynamic) callback,
    bool isDismissible = true,
    double radius = 20.0,
    bool isWithIcon = true,
  }) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(radius))),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      enableDrag: true,
      barrierColor: Color(0x96000000),
      isScrollControlled: data.length > 10,
      isDismissible: isDismissible,
      builder: (context) => Material(
        child: VStack([
          24.heightBox,
          ExDashLine(),
          HStack([
            title.text.size(22).bold.maxLines(1).overflow(TextOverflow.ellipsis).make().pOnly(left: 18, right: 18, bottom: 16, top: 24).expand(),
          ]),
          if (data.length > 4)
            Expanded(
              child: VStack([
                SizedBox(
                  child: ListView.separated(
                    separatorBuilder: (context, index) => Divider(),
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    //Optional
                    itemCount: data.length,
                    //data.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: HStack([
                          data[index].val.text.size(dataTextSize).color(dataTextColor).overflow(TextOverflow.ellipsis).maxLines(1).make().expand(),
                          Icon(Icons.navigate_next_rounded),
                        ]),
                        leading: isWithIcon ? ExImageView(url: '${data[index].icon}', width: 24, height: 24) : null,
                        dense: true,
                        onTap: () {
                          callback.call(data[index].key, data[index].val);
                          Navigator.maybePop(context);
                        },
                      );
                    },
                  ),
                ),
              ]).scrollVertical(),
            )
          else
            VStack([
              SizedBox(
                child: ListView.separated(
                  separatorBuilder: (context, index) => Divider(),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  //Optional
                  itemCount: data.length,
                  //data.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: HStack([
                        data[index].val.text.makeCentered(),
                        Spacer(),
                        Icon(Icons.navigate_next_rounded),
                      ]),
                      leading: ExImageView(url: '${data[index].icon}', width: 24, height: 24),
                      dense: true,
                      onTap: () {
                        callback.call(data[index].key, data[index].val);
                        Navigator.maybePop(context);
                      },
                    );
                  },
                ),
              ),
            ]).scrollVertical(),
        ]),
      ),
    );
  }

  /// -- example implementation --
  /// ```dart
  /// final _data = <KeyVal>[];
  /// repeat(2, (index) {
  ///   _data.add(KeyVal(key: 'key$index', val: 'val$index'));
  /// });
  /// ExBottomSheet.grid(
  ///   context: context,
  ///   title: 'Grid Example',
  ///   data: _data,
  ///   callback: (k, v) {
  ///     ExAlertSuccess(context: Get.context!, message: 'data dengan key $k dipilih');
  ///   },
  /// );
  /// ```
  static void grid({
    required BuildContext context,
    int crossAxisCount = 3,
    String title = '',
    double titleTextSize = 22,
    required List<KeyVal> data,
    double dataTextSize = 14,
    Color dataTextColor = Colors.black,
    required Function(dynamic, dynamic) callback,
    bool isDismissible = true,
    double radius = 20.0,
    bool isWithIcon = true,
  }) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      backgroundColor: Colors.white,
      enableDrag: true,
      barrierColor: Color(0x96000000),
      builder: (context) => Material(
        child: VStack([
          24.heightBox,
          ExDashLine(),
          HStack([
            title.text.size(22).bold.maxLines(1).overflow(TextOverflow.ellipsis).make().pOnly(left: 18, right: 18, bottom: 16, top: 24).expand(),
          ]),
          24.heightBox,
          if (data.length > 6)
            Expanded(
                child: VStack([
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: crossAxisCount,
                physics: NeverScrollableScrollPhysics(),
                children: List.generate(data.length, (index) {
                  return VStack([
                    if (isWithIcon) ExImageView(url: '${data[index].icon}', width: 48, height: 48).centered(),
                    12.heightBox,
                    data[index].val.text.makeCentered(),
                  ]).onInkTap(() {
                    // logW('ExBottomSheetGrid Selected: [${data[index].key} | ${data[index].val}]');
                    callback.call(data[index].key, data[index].val);
                    Navigator.maybePop(context);
                  });
                }),
              )
            ]).scrollVertical())
          else
            VStack([
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: crossAxisCount,
                physics: NeverScrollableScrollPhysics(),
                children: List.generate(data.length, (index) {
                  return VStack([
                    if (isWithIcon) ExImageView(url: '${data[index].icon}', width: 48, height: 48).centered(),
                    12.heightBox,
                    data[index].val.text.makeCentered(),
                  ]).onInkTap(() {
                    // logW('ExBottomSheetGrid Selected: [${data[index].key} | ${data[index].val}]');
                    callback.call(data[index].key, data[index].val);
                    Navigator.maybePop(context);
                  });
                }),
              )
            ]).scrollVertical(),
        ]),
      ),
    );
  }

  /// ExBottomSheet.input(
  ///   context: Get.context!,
  ///   title: lorem(paragraphs: 1, words: 8),
  ///   hint: 'Nama Lengkap',
  ///   onYes: (v) {
  ///     logW('from controller ${lorem(paragraphs: 8)}');
  ///   },
  ///   validator: (p0) {
  ///     if (p0.isEmptyOrNull) {
  ///       return 'ga boleh kosong';
  ///     }
  ///   },
  /// );
  ///
  static void input({
    required BuildContext context,
    required String title,
    String? hint,
    IconData icon = Icons.verified_user,
    String? Function(String?)? validator,
    final TextInputType? textInputType,
    String btnApplyText = 'Apply',
    required Function(dynamic) onYes,
  }) {
    final tfController = TextEditingController();
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      backgroundColor: Colors.white,
      enableDrag: true,
      barrierColor: Color(0x96000000),
      builder: (context) => Material(
        child: CupertinoPageScaffold(
          child: VStack([
            18.heightBox,
            ExDashLine(),
            HStack([
              title.text.size(22).bold.maxLines(1).overflow(TextOverflow.ellipsis).make().pOnly(left: 18, right: 18, bottom: 16, top: 24).expand(),
            ]),
            16.heightBox,
            ExTextFieldIcon(
              controller: tfController,
              hint: hint,
              validator: validator,
              textInputType: textInputType,
              icon: icon,
            ).pOnly(left: 24, right: 24),
            16.heightBox,
            HStack([
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    onYes.call(tfController.text);
                    // logW('input : [${tfController.text}]');
                    // Navigator.maybePop(context);
                  },
                  child: Text(btnApplyText),
                ).cornerRadius(8).h(45),
              ),
            ]).pOnly(left: 24, right: 24, bottom: 32, top: 16),
          ]).scrollVertical(),
        ),
      ),
    );
  }
}
