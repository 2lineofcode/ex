import 'package:ex_kit/ex.dart';
import 'package:example/core/index.dart';
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
              context,
              title: faker.lorem.word(),
              // message: faker.lorem.sentence(),
            ),
          ).expand(),
          12.widthBox,
          ExButtonOutline(
            label: 'T & M',
            width: double.infinity,
            onPressed: () => ExAlert.success(
              context,
              title: faker.lorem.word(),
              message: faker.lorem.sentence(),
            ),
          ).expand(),
          12.widthBox,
          ExButtonOutline(
            label: 'No Asset',
            width: double.infinity,
            onPressed: () => ExAlert.success(context, message: 'asdasd'),
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
              context,
              title: faker.lorem.word(),
            ),
          ).expand(),
          12.widthBox,
          ExButtonOutline(
            label: 'T & M',
            width: double.infinity,
            onPressed: () => ExAlert.error(
              context,
              title: faker.lorem.word(),
              message: faker.lorem.sentence(),
            ),
          ).expand(),
          12.widthBox,
          ExButtonOutline(
            label: 'No Asset',
            width: double.infinity,
            onPressed: () => ExAlert.error(
              context,
              title: faker.lorem.word(),
              message: faker.lorem.sentence(),
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
              context,
              title: faker.lorem.word(),
            ),
          ).expand(),
          12.widthBox,
          ExButtonOutline(
            label: 'T & M',
            width: double.infinity,
            onPressed: () => ExAlert.confirm(
              context,
              title: faker.lorem.word(),
              message: faker.lorem.sentence(),
            ),
          ).expand(),
          12.widthBox,
          ExButtonOutline(
            label: 'No Asset',
            width: double.infinity,
            onPressed: () => ExAlert.confirm(
              context,
              title: faker.lorem.word(),
              message: faker.lorem.sentence(),
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
              context,
              title: faker.lorem.word(),
              color: colorError,
            ),
          ).expand(),
          12.widthBox,
          ExButtonOutline(
            label: 'T & M',
            width: double.infinity,
            onPressed: () => ExAlert.confirm(
              context,
              color: colorError,
              title: faker.lorem.word(),
              message: faker.lorem.sentence(),
            ),
          ).expand(),
          12.widthBox,
          ExButtonOutline(
            label: 'No Asset',
            width: double.infinity,
            onPressed: () => ExAlert.confirm(
              context,
              color: colorError,
              title: faker.lorem.word(),
              message: faker.lorem.sentence(),
            ),
          ).expand(),
        ]),
        Divider().pSymmetric(v: 16),

        /// 5
        'ExAlert.custom'.text.bold.make().pOnly(bottom: 12),
        HStack([
          ExButtonOutline(
            label: 'test',
            width: double.infinity,
            onPressed: () => ExAlert.custom(
              context,
              content: VStack(
                [
                  Text(
                    '${faker.lorem.words(2).join(' ')}',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: colorBlack),
                  ),
                  16.heightBox,
                  Text(
                    '${faker.lorem.sentences(2).join(' ')}',
                    style: TextStyle(fontSize: 12),
                  ),
                  16.heightBox,
                  ExTextField(
                    hint: 'abehbatre/ex',
                    borderRadius: 4,
                  ),
                  24.heightBox,
                  HStack(
                    [
                      Spacer(),
                      ExButtonText(
                        label: 'Cancel',
                        labelColor: colorBlack,
                        onPressed: () {},
                      ),
                      12.widthBox,
                      ExButtonOutline(
                        label: 'Delete',
                        backgroundColor: Vx.neutral100,
                        borderColor: Vx.neutral100,
                        labelColor: colorError,
                        onPressed: () {},
                      )
                    ],
                  ),
                ],
              ),
            ),
          ).expand(),
        ]),
      ]).p16().scrollVertical(),
    );
  }
}
