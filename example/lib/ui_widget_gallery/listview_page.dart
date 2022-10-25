import 'package:ex/ex.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/index.dart';

class TestController extends GetxController {
  final xData = <String>[
    faker.lorem.sentence(),
  ].obs;

  @override
  void onInit() {
    10.forEach((index) {
      xData.add(faker.lorem.sentence());
    });
    super.onInit();
  }

  Future<void> addItem() async {
    ExLoading.show();
    await 300.milliseconds.delay();
    ExLoading.dismiss();
    xData.add(faker.company.name());
  }

  void removeItem(int index) {
    xData.removeAt(index);
  }

  void detailItem(index) {
    final data = xData[index];
    ExSnackbar.info(data);
  }
}

///
class ListViewPage extends GetView<TestController> {
  const ListViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(TestController());
    return Scaffold(
      appBar: AppBar(
        title: 'ExListView'.text.size(16).make(),
        elevation: 0.5,
        leading: IconButton(icon: Icon(Icons.arrow_back_outlined), onPressed: () => Get.back()),
      ),
      body: Obx(
        () => ExListView(
          headerBuilder: (context) {
            return VStack([
              Container(
                width: double.infinity,
                decoration: ExDecorator.box(),
                child: VStack(
                  [
                    'Header Builder'.text.extraBold.black.make(),
                    faker.lorem.sentence().text.italic.make(),
                  ],
                ).p(12),
              ).pOnly(bottom: 24)
            ]);
          },
          itemCount: controller.xData.length,
          itemBuilder: (context, index) {
            return Container(
              decoration: ExDecorator.box(),
              child: HStack(
                [
                  Container(
                    height: 56,
                    width: 64,
                    // decoration: ExDecorator.box(fillColor: colorNeutral[50], borderRadius: 0),
                    color: colorNeutral[50],
                    child: Icon(Icons.link),
                  ),
                  controller.xData[index].text.size(12).thin.maxLines(2).ellipsis.make().pOnly(left: 12).expand(),
                  IconButton(
                    onPressed: () => controller.removeItem(index),
                    icon: Icon(Icons.close, color: colorNeutral, size: 20),
                  ),
                ],
              ),
            ).pSymmetric(v: 4);
          },
          footerBuilder: (context) {
            return ExButtonOutline(
              label: 'Footer Builder',
              leftIcon: Icon(Icons.upload, size: 13),
              borderColor: colorPrimary,
              height: 40,
              isLabelBold: true,
              onPressed: () => controller.addItem(),
            ).pOnly(top: 24);
          },
        ).p16(),
      ),
    );
  }
}
