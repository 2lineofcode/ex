import 'package:ex_kit/ex.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingDialogPage extends GetView<LoadingDialogController> {
  const LoadingDialogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LoadingDialogController());
    return Scaffold(
      appBar: ExAppBar(title: 'Loading Dialog'),
      body: VStack([
        // 1
        'ExLoading.show'.text.make().pOnly(bottom: 8),
        ExButtonOutline(label: 'ExLoading', width: double.infinity, onPressed: () => controller.gget()),
        Divider().pSymmetric(v: 16),
        Obx(
          () => ListView.separated(
            separatorBuilder: (context, index) => Divider(),
            itemCount: controller.dataPosts.length,
            itemBuilder: (context, index) {
              final item = controller.dataPosts[index];
              return ListTile(
                title: '${index + 1}. ${item['title']}'.text.make(),
                subtitle: '${item['body']}'.text.neutral400.size(10).make(),
              );
            },
          ).expand(),
        ),
      ]).p16(),
    );
  }
}

class LoadingDialogController extends GetxController {
  final dataPosts = [].obs;

  Future<void> gget() async {
    ExLoading.show(Get.context!);
    logD('wait 10 second...');
    await 10.seconds.delay();
    ExLoading.dismiss(Get.context!);
    logD('done...');
  }
}
