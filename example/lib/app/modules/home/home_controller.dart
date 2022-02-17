import 'package:ex/ex.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeController extends GetxController {

  void list() {
    final _data = <KeyVal>[];
    repeat(10, (index) {
      _data.add(KeyVal(key: 'key$index', val: 'val  $index'));
    });
    ExBottomSheet.list(
      context: Get.context!,
      title: 'Pilihan',
      data: _data,
      callback: (k, v) {
        Get.snackbar('$v', 'data dengan key $k dipilih');
        // ExAlertSuccess(context: Get.context!, message: 'data dengan key $k dipilih');
      },
    );
  }

  void grid() {
    final datas = <KeyVal>[];
    repeat(2, (index) {
      datas.add(KeyVal(key: 'key$index', val: 'val$index'));
    });
    ExBottomSheet.grid(
      context: Get.context!,
      title: 'Pilihan',
      data: datas,
      callback: (k, v) {
        Get.snackbar('$v', 'data dengan key $k dipilih');
        // ExAlertSuccess(context: Get.context!, message: 'data dengan key $k dipilih');
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
