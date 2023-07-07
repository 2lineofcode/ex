import 'package:ex/ex.dart';
import 'package:example/core/index.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ErrorOrEmptyPage extends GetView<ErrorOrEmptyController> {
  @override
  Widget build(BuildContext context) {
    Get.put(ErrorOrEmptyController());
    return Scaffold(
      appBar: AppBar(
        title: 'ErrorOrEmpty'.text.extraBold.size(16).make(),
        elevation: 0.5,
        leading: IconButton(icon: Icon(Icons.arrow_back_outlined), onPressed: () => Get.back()),
      ),
      body: VStack([
        HStack(
          [
            ExButtonOutline(
              label: 'Error Page',
              onPressed: () => controller.currentState.value = 0,
            ).expand(),
            12.widthBox,
            ExButtonOutline(
              label: 'Empty Page',
              onPressed: () => controller.currentState.value = 1,
            ).expand(),
          ],
        ).pOnly(bottom: 16),
        controller.obx(
          (state) => Obx(
            () => ExUiErrorOrEmpty(
              illustration: controller.currentState.value == 0 ? Icon(Icons.error, color: colorError) : Icon(Icons.question_answer, color: colorPrimary),
              title: '${faker.lorem.word()}'.text.black.bold.size(18).makeCentered(),
              message: '${faker.lorem.sentences(2)}'.text.size(13).align(TextAlign.center).makeCentered(),
              action: ExButtonElevated(
                label: 'Retry',
                labelSize: 12,
                radius: 90,
                backgroundColor: controller.currentState.value == 0 ? colorError : colorPrimary,
                labelColor: colorWhite,
                onPressed: () => controller.reload(),
              ).centered(),
            ).expand(),
          ),
          onLoading: ExUiLoading().expand(),
        ),
      ]).p24(),
    );
  }
}

class ErrorOrEmptyController extends GetxController with StateMixin {
  final currentState = 0.obs;

  @override
  Future<void> onInit() async {
    change(0, status: RxStatus.loading());
    await 1.seconds.delay();
    change(0, status: RxStatus.success());
    super.onInit();
  }

  Future<void> reload() async {
    change(0, status: RxStatus.loading());
    await 2.seconds.delay();
    change(0, status: RxStatus.success());
  }
}
