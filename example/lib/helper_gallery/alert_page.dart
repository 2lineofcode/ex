import 'package:ex/ex.dart';
import 'package:example/core/index.dart';
import 'package:faker/faker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlertPage extends StatelessWidget {
  const AlertPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 'Alert'.text.extraBold.size(16).make(),
      ),
      body: VStack([
        /// 0
        'ExAlert.adaptive'.text.bold.make().pOnly(bottom: 12),
        HStack([
          ExButtonOutline(
            label: 'adaptive',
            width: double.infinity,
            onPressed: () {
              ExAlert.adaptive(
                title: Text(
                  'Title',
                  textAlign: TextAlign.left,
                ).pOnly(bottom: 12),
                content: VStack(
                  [
                    /// 1
                    CupertinoTextField(
                      placeholder: 'Nasi Padang',
                      placeholderStyle: TextStyle(fontSize: 13, color: Vx.neutral500),
                      style: TextStyle(
                        fontSize: 13,
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                      ),
                      prefix: Text(
                        'Notes',
                        textAlign: TextAlign.left,
                      ).pOnly(left: 8).w(70),
                    ),

                    8.heightBox,

                    /// 2
                    CupertinoTextField(
                      placeholder: 'Food',
                      placeholderStyle: TextStyle(fontSize: 13, color: Vx.neutral500),
                      style: TextStyle(
                        fontSize: 13,
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                      ),
                      prefix: Text(
                        'Category',
                        textAlign: TextAlign.left,
                      ).pOnly(left: 8).w(70),
                    ),

                    8.heightBox,

                    /// 3
                    CupertinoTextField(
                      placeholder: 'Rp. 10.000',
                      placeholderStyle: TextStyle(fontSize: 13, color: Vx.neutral500),
                      style: TextStyle(
                        fontSize: 13,
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                      ),
                      prefix: Text(
                        'Amount',
                        textAlign: TextAlign.left,
                      ).pOnly(left: 8).w(70),
                    ),
                  ],
                ),
                actions: [
                  CupertinoDialogAction(
                    child: Text("OK"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          ).expand(),
        ]),
        Divider().pSymmetric(v: 16),

        /// 1
        'ExAlert.success'.text.bold.make().pOnly(bottom: 12),
        HStack([
          ExButtonOutline(
            label: 'T only',
            width: double.infinity,
            onPressed: () => ExAlert.success(
              title: faker.lorem.sentences(10).join(),
            ),
          ).expand(),
          12.widthBox,
          ExButtonOutline(
            label: 'T & M',
            width: double.infinity,
            onPressed: () => ExAlert.success(
              title: faker.lorem.word(),
              message: faker.lorem.sentences(5).join(),
            ),
          ).expand(),
          12.widthBox,
          ExButtonOutline(
            label: 'Uniq',
            width: double.infinity,
            onPressed: () => ExAlert.success(
              icon: Icon(Icons.access_time_outlined, size: 48, color: Vx.pink400),
              title: 'isDismissible: false',
              radius: 12,
              isDismissible: false,
              btnYesText: 'Tap to close',
              onYes: () => {
                Get.back(),
                ExSnackbar.info('Closed'),
              },
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
            onPressed: () => ExAlert.error(icon: Container()),
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
              color: colorError,
            ),
          ).expand(),
          12.widthBox,
          ExButtonOutline(
            label: 'T & M',
            width: double.infinity,
            onPressed: () => ExAlert.confirm(
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
              padding: 12,
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
                ],
              ),
            ),
          ).expand(),
        ]),
      ]).p16().scrollVertical(),
    );
  }
}
