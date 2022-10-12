import 'package:ex/ex.dart';
import 'package:faker/faker.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'loading_page.dart';

class ShimmerPage extends GetView<LoadingController> {
  @override
  Widget build(BuildContext context) {
    Get.put(LoadingController());
    return Scaffold(
      appBar: AppBar(
        title: 'Shimmer'.text.extraBold.size(16).make(),
        elevation: 0.5,
        leading: IconButton(icon: Icon(Icons.arrow_back_outlined), onPressed: () => Get.back()),
        actions: [
          IconButton(onPressed: () => controller.onInit(), icon: Icon(Icons.replay_outlined)),
        ],
      ),
      body: controller.obx(
        onLoading: ExUiShimmerList(),
        (state) => VStack([
          'DATA LOADED'.text.xl.makeCentered().pOnly(bottom: 16),
          '${faker.lorem.sentence()}'.text.center.green600.makeCentered(),
        ]).centered().p12(),
      ),
    );
  }
}
