import 'package:ex/ex.dart';
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
    logD('load api service...');
    final apiService = Get.find<ExHttp>();
    logD('show dialog...');
    ExLoading.show(message: 'Getting data...');
    logD('wait 10 second...');
    await 10.seconds.delay();
    logD('getting data...');
    apiService.get('/posts').then((value) {
      dataPosts.value = value.body;
      logD('data loaded...');
    });
    ExLoading.dismiss();
    logD('done...');
  }
}
