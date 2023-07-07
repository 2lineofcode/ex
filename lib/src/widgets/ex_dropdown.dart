import 'package:ex/ex.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExDropdownController extends GetxController {
  ExDropdownController(this.initialValue);
  final String initialValue;

  final tfController = TextEditingController();

  @override
  void onInit() {
    tfController.text = initialValue;
    super.onInit();
  }

  void onTap({
    required String title,
    required List<ExKeyValue> data,
    Function(dynamic, String)? callback,
  }) {
    ExBottomSheet.basic(
      title: '$title',
      content: ListView.separated(
        shrinkWrap: true,
        itemCount: data.length,
        separatorBuilder: (context, index) => Divider(),
        itemBuilder: (context, index) {
          final item = data[index];
          return ListTile(
            leading: item.icon,
            title: '${item.value}'.text.make(),
            trailing: item.isSelected == true ? Icon(Icons.radio_button_checked) : null,
            onTap: () {
              tfController.text = item.value;
              callback?.call(item.key, item.value);
              Get.back();
            },
          );
        },
      ),
    );
  }
}

class ExDropdown extends StatelessWidget {
  const ExDropdown({
    required this.data,
    this.initialValue,
    this.callback,
    this.title = 'Options',
    this.textStyle,
    this.hint,
    super.key,
  });

  final String? initialValue;
  final String? hint;
  final List<ExKeyValue> data;
  final String title;
  final TextStyle? textStyle;
  final Function(dynamic, String)? callback;

  @override
  Widget build(BuildContext context) {
    Get.put(ExDropdownController(initialValue ?? ''));
    final controller = Get.find<ExDropdownController>();

    return ExTextField(
      controller: controller.tfController,
      hint: hint,
      suffixIcon: Icon(Icons.keyboard_arrow_down_rounded, color: Vx.neutral500),
      enabled: false,
      style: textStyle,
    ).onInkTap(() {
      controller.onTap(title: title, data: data);
    });
  }
}
