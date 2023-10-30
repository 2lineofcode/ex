import 'package:ex_kit/ex.dart';
import 'package:faker/faker.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingController extends GetxController with StateMixin {
  @override
  Future<void> onInit() async {
    log('im here..');
    change(0, status: RxStatus.loading());
    await 5.seconds.delay();
    change(0, status: RxStatus.success());
    super.onInit();
  }
}

class LoadingPage extends GetView<LoadingController> {
  @override
  Widget build(BuildContext context) {
    Get.put(LoadingController());
    return Scaffold(
      appBar: AppBar(
        title: 'Loading'.text.extraBold.size(16).make(),
        elevation: 0.5,
        leading: IconButton(icon: Icon(Icons.arrow_back_outlined), onPressed: () => Get.back()),
        actions: [
          IconButton(onPressed: () => controller.onInit(), icon: Icon(Icons.replay_outlined)),
        ],
      ),
      body: controller.obx(
        (state) => ExContainer(
          child: VStack(
            [
              'DATA LOADED'.text.xl.makeCentered().pOnly(bottom: 16),
              '${faker.lorem.sentence()}'.text.center.green600.makeCentered(),
            ],
          ).centered().p12(),
        ),
        onLoading: ExUiLoading(),
      ),
    );
  }
}
