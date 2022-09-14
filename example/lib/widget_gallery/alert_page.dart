import 'package:ex/ex.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  const AlertPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 'Alert'.text.extraBold.size(16).make(),
      ),
      body: VStack([
        /// 1
        'ExAlert.success'.text.bold.make().pOnly(bottom: 12),
        HStack([
          ExButtonOutline(
            label: 'T only',
            width: double.infinity,
            onPressed: () => ExAlert.success(
              title: faker.lorem.word(),
              // message: faker.lorem.sentence(),
            ),
          ).expand(),
          12.widthBox,
          ExButtonOutline(
            label: 'T & M',
            width: double.infinity,
            onPressed: () => ExAlert.success(
              title: faker.lorem.word(),
              message: faker.lorem.sentence(),
            ),
          ).expand(),
          12.widthBox,
          ExButtonOutline(
            label: 'No Asset',
            width: double.infinity,
            onPressed: () => ExAlert.success(
              title: faker.lorem.word(),
              message: faker.lorem.sentence(),
              showAsset: false,
            ),
          ).expand(),
        ]),
        Divider().pSymmetric(v: 16),

        /// 2
        'ExAlert.error'.text.bold.make().pOnly(bottom: 12),
        HStack([
          ExButtonOutline(
            label: 'T only',
            width: double.infinity,
            onPressed: () => ExAlert.error(
              title: faker.lorem.word(),
            ),
          ).expand(),
          12.widthBox,
          ExButtonOutline(
            label: 'T & M',
            width: double.infinity,
            onPressed: () => ExAlert.error(
              title: faker.lorem.word(),
              message: faker.lorem.sentence(),
            ),
          ).expand(),
          12.widthBox,
          ExButtonOutline(
            label: 'No Asset',
            width: double.infinity,
            onPressed: () => ExAlert.error(
              title: faker.lorem.word(),
              message: faker.lorem.sentence(),
              showAsset: false,
            ),
          ).expand(),
        ]),
        Divider().pSymmetric(v: 16),

        /// 3
        'ExAlert.confirm (Primary)'.text.bold.make().pOnly(bottom: 12),
        HStack([
          ExButtonOutline(
            label: 'T only',
            width: double.infinity,
            onPressed: () => ExAlert.confirm(
              title: faker.lorem.word(),
            ),
          ).expand(),
          12.widthBox,
          ExButtonOutline(
            label: 'T & M',
            width: double.infinity,
            onPressed: () => ExAlert.confirm(
              title: faker.lorem.word(),
              message: faker.lorem.sentence(),
            ),
          ).expand(),
          12.widthBox,
          ExButtonOutline(
            label: 'No Asset',
            width: double.infinity,
            onPressed: () => ExAlert.confirm(
              title: faker.lorem.word(),
              message: faker.lorem.sentence(),
              showAsset: false,
            ),
          ).expand(),
        ]),
        Divider().pSymmetric(v: 16),

        /// 4
        'ExAlert.confirm (Warning)'.text.bold.make().pOnly(bottom: 12),
        HStack([
          ExButtonOutline(
            label: 'T only',
            width: double.infinity,
            onPressed: () => ExAlert.confirm(
              title: faker.lorem.word(),
              isWarningMode: true,
            ),
          ).expand(),
          12.widthBox,
          ExButtonOutline(
            label: 'T & M',
            width: double.infinity,
            onPressed: () => ExAlert.confirm(
              title: faker.lorem.word(),
              message: faker.lorem.sentence(),
              isWarningMode: true,
            ),
          ).expand(),
          12.widthBox,
          ExButtonOutline(
            label: 'No Asset',
            width: double.infinity,
            onPressed: () => ExAlert.confirm(
              title: faker.lorem.word(),
              message: faker.lorem.sentence(),
              showAsset: false,
              isWarningMode: true,
            ),
          ).expand(),
        ]),
      ]).p16().scrollVertical(),
    );
  }
}
