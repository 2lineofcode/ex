import 'package:ex/ex.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeController extends GetxController {
  void showAlert() {
    ExSnackbar.info(
      context: Get.context!,
      title: 'This is a title',
      message: 'Please wait ...',
      isDismissible: false,
    );
    Future.delayed(3.seconds).then((value) => ExLoading.dismiss(Get.context!));
  }

  void list() {
    final _data = <KeyVal>[];
    10.forEach((index) {
      _data.add(KeyVal(key: 'key$index', val: 'val  $index'));
    });
    ExBottomSheet.list(
      context: Get.context!,
      title: 'Select Your Type',
      data: _data,
      callback: (k, v) async {
        Get.back();
        ExSnackbar.uploading(context: Get.context!, message: 'message');
      },
    );
  }

  void grid() {
    final _data = <KeyVal>[];
    10.forEach((index) {
      _data.add(KeyVal(key: 'key$index', val: 'val  $index'));
    });
    ExBottomSheet.grid(
      context: Get.context!,
      title: 'Select Your Type',
      data: _data,
      callback: (k, v) async {
        Get.back();
        ExSnackbar.uploading(context: Get.context!, message: 'message');
      },
    );
  }

  void input() {
    ExBottomSheet.input(
      context: Get.context!,
      title: lorem(paragraphs: 1, words: 8),
      hint: 'Nama Lengkap',
      onYes: (v) {
        logW(lorem(paragraphs: 9));
      },
      validator: (p0) {
        if (p0.isEmptyOrNull) {
          return 'ga boleh kosong';
        }
      },
    );
  }

  void custom() {
    ExBottomSheet.custom(
      context: Get.context!,
      title: 'This is Title',
      body: VStack([
        'this is body'.text.make(),
        24.heightBox,
        HStack([
          ExImageView(url: 'url'),
          24.widthBox,
          ExAvatarView(url: 'url', name: 'name'),
        ]),
        HStack([
          ExButtonDefault(),
          24.widthBox,
          ExButtonOutline(),
        ]),
        110.heightBox,
        '... try to scroll me ...'.text.size(22).makeCentered().w(double.infinity),
        110.heightBox,
        'end of this is body'.text.make(),
      ]),
      footer: HStack([
        ExButtonDefault().expand(),
        16.widthBox,
        ExButtonOutline().expand(),
      ]),
    );
  }

  void loading() {
    ExLoading.show(context: Get.context!);
    Future.delayed(3.seconds).then((value) => ExLoading.dismiss(Get.context!));
  }
}
