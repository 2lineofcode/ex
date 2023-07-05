import 'package:ex/ex.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HttpController extends GetxController {
  final output = [].obs;
  final apiService = Get.find<ExHttp>();

  Future<void> hget() async {
    await apiService.httpGet(endPoint: '/posts').then((response) {
      output.value = response.body;
      Get.forceAppUpdate();
    }).catchError((e) {
      ExSnackbar.danger(e);
    });
  }

  Future<void> hpost() async {
    ExLoading.show(
      child: VStack(
        [
          Icon(Icons.ac_unit).centered().pOnly(bottom: 8),
          'loading'.text.size(12).makeCentered(),
        ],
      ),
    );
    await apiService.httpPost(endPoint: '/posts').then((response) {
      ExSnackbar.success(response.statusCode);
    }).catchError((e) {
      ExSnackbar.danger(e);
    });
    ExLoading.dismiss();
  }

  Future<void> hput() async {
    ExLoading.show();
    await apiService.httpPut(endPoint: '/posts/1').then((response) {
      ExSnackbar.success(response.statusCode);
    }).catchError((e) {
      ExSnackbar.danger(e);
    });
    ExLoading.dismiss();
  }

  Future<void> hdelete() async {
    ExLoading.show();
    await apiService.httpDelete(endPoint: '/posts/1').then((response) {
      ExSnackbar.success(response.statusCode);
    }).catchError((e) {
      ExSnackbar.danger(e);
    });
    ExLoading.dismiss();
  }
}

class HttpPage extends GetView<HttpController> {
  @override
  Widget build(BuildContext context) {
    Get.put(HttpController());

    return Scaffold(
      appBar: AppBar(
        title: 'ExHttp'.text.extraBold.size(16).make(),
      ),
      body: VStack(
        [
          Wrap(
            children: [
              ExButtonOutline(
                label: 'GET',
                onPressed: () => controller.hget(),
              ).pOnly(right: 12, bottom: 12),
              ExButtonOutline(
                label: 'POST',
                onPressed: () => controller.hpost(),
              ).pOnly(right: 12, bottom: 12),
              ExButtonOutline(
                label: 'PUT',
                onPressed: () => controller.hput(),
              ).pOnly(right: 12, bottom: 12),
              ExButtonOutline(
                label: 'DELETE',
                onPressed: () => controller.hdelete(),
              ).pOnly(right: 12, bottom: 12),
              ExButtonOutline(
                label: 'UPLOAD',
              ).pOnly(right: 12, bottom: 12),
              ExButtonOutline(
                label: 'DOWNLOAD',
              ).pOnly(right: 12, bottom: 12),
            ],
          ),
          VxJson.list(controller.output),
        ],
      ).p12().scrollVertical(),
    );
  }
}
