import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:velocity_x/velocity_x.dart';

class TypographyPage extends GetView {
  const TypographyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 'Typography'.text.extraBold.size(16).make(),
        elevation: 0.5,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_outlined), onPressed: () => Get.back()),
      ),
      body: VStack([
        faker.lorem.sentence().text.make().pOnly(bottom: 12),
        faker.lorem.sentence().text.make().pOnly(bottom: 12),
        faker.lorem.sentence().text.make().pOnly(bottom: 12),
        faker.lorem.sentence().text.make().pOnly(bottom: 12),
        faker.lorem.sentence().text.overline.make().pOnly(bottom: 12),
        faker.lorem.sentence().text.underline.make().pOnly(bottom: 12),
        Divider().paddingSymmetric(vertical: 8),
        'headline1'.text.make().pOnly(bottom: 12),
        'bodyText1'.text.make().pOnly(bottom: 12),
        'bodyText2'.text.make().pOnly(bottom: 12),
        'caption'.text.make().pOnly(bottom: 12),
        'overline'.text.overline.make().pOnly(bottom: 12),
        'underline'.text.underline.make().pOnly(bottom: 12),
        Divider().paddingSymmetric(vertical: 8),
        'velocityX - xl'.text.xl.make().pOnly(bottom: 12),
        'velocityX - xl2'.text.xl2.make().pOnly(bottom: 12),
        'velocityX - xl3'.text.xl3.make().pOnly(bottom: 12),
        'velocityX - xl4'.text.xl4.make().pOnly(bottom: 12),
        'velocityX - xl5'.text.xl5.make().pOnly(bottom: 12),
        'velocityX - xl6'.text.xl6.make().pOnly(bottom: 12),
      ]).p24().scrollVertical(),
    );
  }
}
