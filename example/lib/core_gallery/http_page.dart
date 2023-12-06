import 'dart:io';

import 'package:ex/ex.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

class HttpController extends GetxController with StateMixin {
  final output = [].obs;
  final apiService = Get.find<ExHttp>();

  @override
  onInit() async {
    await hget();
    super.onInit();
  }

  Future<void> hget() async {
    change(2, status: RxStatus.loading());
    await 500.milliseconds.delayed();
    await apiService.get('/posts').then((response) {
      output.value = response.body;
      Get.forceAppUpdate();
      change(2, status: RxStatus.success());
    }).catchError((e) {
      ExSnackbar.danger(e);
    });
  }

  Future<void> hpost() async {
    ExLoading.show(
      paddingSymmetric: 70,
      child: VStack(
        [
          'Custom'.text.makeCentered().pOnly(bottom: 24),
          LoadingAnimationWidget.discreteCircle(
            color: Theme.of(Get.context!).primaryColor,
            size: 32,
          ).centered(),
          HStack(
            [
              Icon(Icons.android),
              12.widthBox,
              Icon(Icons.ios_share),
            ],
          ).pSymmetric(v: 12),
          ExButtonElevated(
            label: 'Cancel',
            width: double.infinity,
            onPressed: () {},
          )
        ],
      ),
    );

    await apiService.post('/posts').then((response) {
      ExSnackbar.success(response.statusCode);
    }).catchError((e) {
      ExSnackbar.danger(e);
    });
    ExLoading.dismiss();
  }

  Future<void> hput() async {
    ExLoading.show();
    await apiService.put('/posts/1').then((response) {
      ExSnackbar.success(response.statusCode);
    }).catchError((e) {
      ExSnackbar.danger(e);
    });
    ExLoading.dismiss();
  }

  Future<void> hdelete() async {
    ExLoading.show();
    await apiService.delete('/posts/1').then((response) {
      ExSnackbar.success(response.statusCode);
    }).catchError((e) {
      ExSnackbar.danger(e);
    });
    ExLoading.dismiss();
  }

  Future<void> hpatch() async {
    ExLoading.show();
    await apiService.patch('/posts/1').then((response) {
      ExSnackbar.success(response.statusCode);
    }).catchError((e) {
      ExSnackbar.danger(e);
    });
    ExLoading.dismiss();
  }

  Future<void> hHead() async {
    ExLoading.show();
    apiService.head('/posts').then((r) {
      ExSnackbar.success('r: ${r.statusText}');
      ExLoading.dismiss();
    }).catchError((e) {
      ExSnackbar.danger('e: $e');
      ExLoading.dismiss();
    });
  }

  Future<void> hConnect() async {
    ExLoading.show();
    apiService.connect('/posts').then((r) {
      ExSnackbar.success('r: ${r.statusText}');
      ExLoading.dismiss();
    }).catchError((e) {
      ExSnackbar.danger('e: $e');
      ExLoading.dismiss();
    });
  }

  Future<void> hOptions() async {
    ExLoading.show();
    apiService.options('/posts').then((r) {
      ExSnackbar.success('r: ${r.statusText}');
      ExLoading.dismiss();
    }).catchError((e) {
      ExSnackbar.danger('e: $e');
      ExLoading.dismiss();
    });
  }

  Future<void> hTrace() async {
    ExLoading.show();
    apiService.trace('/posts').then((r) {
      ExSnackbar.success('r: ${r.statusText}');
      ExLoading.dismiss();
    }).catchError((e) {
      ExSnackbar.danger('e: $e');
      ExLoading.dismiss();
    });
  }

  hDownload() async {
    final savePath = (await getTemporaryDirectory()).path + '/mobil-bagus.jpg';
    await apiService
        .download(
            'https://images.pexels.com/photos/1402787/pexels-photo-1402787.jpeg?cs=srgb&dl=pexels-vlad-alexandru-popa-1402787.jpg&fm=jpg',
            savePath)
        .then((r) {
      ExAlert.success(title: 'Success', message: '$r');
    });
  }

  Future<void> hUpload() async {
    final progress = 0.0.obs;

    final form = {
      "name": 'name',
      "email": 'email',
      "address": 'address',
      "avatar": MultipartFile(File(''), filename: 'fileName'),
    };

    try {
      await apiService.put(
        '/upload',
        header: {HttpHeaders.authorizationHeader: '*'},
        body: form,
        uploadProgress: (p0) => progress.value = p0,
      );
    } on Exception catch (e) {
      ExSnackbar.danger('e: $e');
      ExLoading.dismiss();
    }
  }

  hCustom() async {
    await apiService.request('https://api.github.com/', 'get').then((r) {
      ExSnackbar.success('r: ${r.body['repository_search_url']}');
    });
  }
}

class HttpPage extends GetView<HttpController> {
  @override
  Widget build(BuildContext context) {
    Get.put(HttpController());

    return Scaffold(
      appBar: AppBar(title: 'ExHttp'.text.extraBold.size(16).make()),
      body: VStack(
        [
          Wrap(
            children: [
              ExButtonOutline(
                label: 'GET',
                labelSize: 12,
                height: 38,
                onPressed: () => controller.hget(),
              ).pOnly(right: 8, bottom: 8),
              ExButtonOutline(
                label: 'POST',
                labelSize: 12,
                height: 38,
                onPressed: () => controller.hpost(),
              ).pOnly(right: 8, bottom: 8),
              ExButtonOutline(
                label: 'PUT',
                labelSize: 12,
                height: 38,
                onPressed: () => controller.hput(),
              ).pOnly(right: 8, bottom: 8),
              ExButtonOutline(
                label: 'DELETE',
                labelSize: 12,
                height: 38,
                onPressed: () => controller.hdelete(),
              ).pOnly(right: 8, bottom: 8),
              ExButtonOutline(
                label: 'PATCH',
                labelSize: 12,
                height: 38,
                onPressed: () => controller.hpatch(),
              ).pOnly(right: 8, bottom: 8),
              ExButtonOutline(
                label: 'HEAD',
                labelSize: 12,
                height: 38,
                onPressed: () => controller.hHead(),
              ).pOnly(right: 8, bottom: 8),
              ExButtonOutline(
                label: 'CONNECT',
                labelSize: 12,
                height: 38,
                onPressed: () => controller.hConnect(),
              ).pOnly(right: 8, bottom: 8),
              ExButtonOutline(
                label: 'OPTIONS',
                labelSize: 12,
                height: 38,
                onPressed: () => controller.hOptions(),
              ).pOnly(right: 8, bottom: 8),
              ExButtonOutline(
                label: 'TRACE',
                labelSize: 12,
                height: 38,
                onPressed: () => controller.hTrace(),
              ).pOnly(right: 8, bottom: 8),
              ExButtonOutline(
                label: 'DOWNLOAD',
                labelSize: 12,
                height: 38,
                onPressed: () async => await controller.hDownload(),
              ).pOnly(right: 8, bottom: 8),
              ExButtonOutline(
                label: 'UPLOAD',
                labelSize: 12,
                height: 38,
                onPressed: () => controller.hUpload(),
              ).pOnly(right: 8, bottom: 8),
              ExButtonOutline(
                label: 'CUSTOM',
                labelSize: 12,
                height: 38,
                onPressed: () async => await controller.hCustom(),
              ).pOnly(right: 8, bottom: 8),
            ],
          ),
          Divider(),
          controller.obx(
            (state) => ListView.separated(
              itemCount: controller.output.length,
              separatorBuilder: (BuildContext context, int index) => Divider(),
              itemBuilder: (context, index) {
                final item = controller.output[index];
                return ListTile(
                  title: '${index + 1}. ${item['title']}'
                      .text
                      .maxLines(1)
                      .ellipsis
                      .minFontSize(14)
                      .make(),
                  subtitle: '${item['body']}'
                      .text
                      .neutral400
                      .maxLines(1)
                      .ellipsis
                      .make(),
                );
              },
            ).expand(),
            onLoading: ExUiLoading().expand(),
          ),
        ],
      ).p12(),
    );
  }
}
