import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../ex.dart';
import '../color.dart';

class _ExMessageController extends GetxController {
  final isVisible = true.obs;
}

class ExMessage extends GetView<_ExMessageController> {
  const ExMessage({
    Key? key,
    this.fillColor,
    this.borderColor,
    this.borderRadius,
    this.content,
  }) : super(key: key);
  final Color? fillColor;
  final Color? borderColor;
  final double? borderRadius;
  final Widget? content;

  @override
  Widget build(BuildContext context) {
    Get.put(_ExMessageController());
    return Obx(
      () => Visibility(
        visible: controller.isVisible.value,
        child: Container(
          decoration: ExDecorator.commonBoxDecoration(
            fillColor: fillColor ?? colorDisclaimerLight,
            borderColor: borderColor ?? colorDisclaimer,
            borderRadius: borderRadius ?? 2,
          ),
          child: HStack([
            if (content != null) content!.p8().expand(),
            CloseButton(
              color: colorNeutral,
              onPressed: () {
                controller.isVisible.value = false;
              },
            ),
          ]).p(0),
        ),
      ),
    );
  }
}
