import 'package:ex/ex.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeController extends GetxController {

  final count = 0.obs;

  void list() {
    final _data = <KeyVal>[];
    repeat(2, (index) {
      _data.add(KeyVal(key: 'key$index', val: 'val$index'));
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
        logW('from controller ${lorem(paragraphs: 8)}');
      },
      validator: (p0) {
        if (p0.isEmptyOrNull) {
          return 'ga boleh kosong';
        }
      },
    );
  }

  void custom() {
    final datas = <KeyVal>[];
    repeat(2, (index) {
      datas.add(KeyVal(key: 'key$index', val: 'val$index'));
    });
    ExBottomSheet.custom(
      context: Get.context!,
      title: 'Pilihan',
      body: VStack([
        'this is body'.text.make(),
      ]),
      footer: HStack([
        'this is footer'.text.make(),
      ]),
    );
  }

  void loading() {
    ExLoading.show(context: Get.context!);
    Future.delayed(3.seconds).then((value) => ExLoading.dismiss(Get.context!));
  }

  @override
  void onClose() {}

  void increment() => count.value++;
}
