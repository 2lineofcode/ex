import 'package:ex_kit/ex.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

class SnackbarPage extends StatelessWidget {
  const SnackbarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 'SnackBar'.text.extraBold.size(16).make(),
      ),
      body: VStack([
        'ExSnackbar.neutral'.text.bold.make().pOnly(bottom: 12),
        HStack([
          ExButtonOutline(
            label: 'Neutral',
            width: double.infinity,
            onPressed: () => ExSnackbar.neutral(faker.lorem.sentence()),
          ).expand(),
          12.widthBox,
          ExButtonOutline(
            label: 'Neutral Top',
            width: double.infinity,
            onPressed: () => ExSnackbar.neutralTop(faker.lorem.sentence()),
          ).expand(),
        ]),

        // —————————————————————————————————————————————————————————————————————————————
        Divider().pSymmetric(v: 16),

        'ExSnackbar.info'.text.bold.make().pOnly(bottom: 12),
        HStack([
          ExButtonOutline(
            label: 'Info',
            width: double.infinity,
            onPressed: () => ExSnackbar.info(faker.lorem.sentence()),
          ).expand(),
          12.widthBox,
          ExButtonOutline(
            label: 'Info Top',
            width: double.infinity,
            onPressed: () => ExSnackbar.infoTop(faker.lorem.sentence()),
          ).expand(),
        ]),

        // —————————————————————————————————————————————————————————————————————————————
        Divider().pSymmetric(v: 16),
        'ExSnackbar.warning'.text.bold.make().pOnly(bottom: 12),
        HStack([
          ExButtonOutline(
            label: 'Warning',
            width: double.infinity,
            onPressed: () => ExSnackbar.warning(faker.lorem.sentence()),
          ).expand(),
          12.widthBox,
          ExButtonOutline(
            label: 'Warning Top',
            width: double.infinity,
            onPressed: () => ExSnackbar.warningTop(faker.lorem.sentence()),
          ).expand(),
        ]),

        // —————————————————————————————————————————————————————————————————————————————
        Divider().pSymmetric(v: 16),
        'ExSnackbar.success'.text.bold.make().pOnly(bottom: 12),
        HStack([
          ExButtonOutline(
            label: 'Success',
            width: double.infinity,
            onPressed: () => ExSnackbar.success(faker.lorem.sentence()),
          ).expand(),
          12.widthBox,
          ExButtonOutline(
            label: 'Success Top',
            width: double.infinity,
            onPressed: () => ExSnackbar.successTop(faker.lorem.sentence()),
          ).expand(),
        ]),

        // —————————————————————————————————————————————————————————————————————————————
        Divider().pSymmetric(v: 16),
        'ExSnackbar.danger'.text.bold.make().pOnly(bottom: 12),
        HStack([
          12.widthBox,
          ExButtonOutline(
            label: 'Danger',
            width: double.infinity,
            onPressed: () => ExSnackbar.danger(faker.lorem.sentence()),
          ).expand(),
          12.widthBox,
          ExButtonOutline(
            label: 'Danger Top',
            width: double.infinity,
            onPressed: () => ExSnackbar.dangerTop(faker.lorem.sentence()),
          ).expand(),
        ]),
      ]).p16().scrollVertical(),
    );
  }
}
