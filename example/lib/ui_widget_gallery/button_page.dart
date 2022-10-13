import 'package:ex/ex.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

import '../core/index.dart';

class ButtonPage extends StatelessWidget {
  const ButtonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 'Button'.text.extraBold.size(16).make(),
      ),
      body: VStack([
        'Default'.text.bold.make().pOnly(bottom: 12),
        HStack([
          ExButtonDefault(
            label: faker.lorem.word(),
          ),
          16.widthBox,
          ExButtonDefault(
            label: faker.lorem.word(),
            width: double.infinity,
          ).expand(),
        ]),

        // —————————————————————————————————————————————————————————————————————————————
        Divider().pSymmetric(v: 16),
        'Default Disable'.text.bold.make().pOnly(bottom: 12),
        HStack([
          ExButtonDefault(
            label: faker.lorem.word(),
            isEnable: false,
          ),
          16.widthBox,
          ExButtonDefault(
            label: faker.lorem.word(),
            width: double.infinity,
            isEnable: false,
          ).expand(),
        ]),

        // —————————————————————————————————————————————————————————————————————————————
        Divider().pSymmetric(v: 16),
        'Outline'.text.bold.make().pOnly(bottom: 12),
        HStack([
          ExButtonOutline(
            label: faker.lorem.word(),
          ),
          16.widthBox,
          ExButtonOutline(
            label: faker.lorem.word(),
            width: double.infinity,
          ).expand(),
        ]),

        // —————————————————————————————————————————————————————————————————————————————
        Divider().pSymmetric(v: 16),
        'Outline Disable'.text.bold.make().pOnly(bottom: 12),
        HStack([
          ExButtonOutline(
            label: faker.lorem.word(),
            isEnable: false,
          ),
          16.widthBox,
          ExButtonOutline(
            label: faker.lorem.word(),
            width: double.infinity,
            isEnable: false,
          ).expand(),
        ]),

        // —————————————————————————————————————————————————————————————————————————————
        Divider().pSymmetric(v: 16),
        'Default with Option'.text.bold.make().pOnly(bottom: 12),
        HStack([
          ExButtonDefault(
            label: 'bold & icon',
            backgroundColor: colorDisclaimer,
            leftIcon: Icon(Icons.info),
          ),
          16.widthBox,
          ExButtonDefault(
            label: 'badge',
            backgroundColor: colorSuccessLight,
            labelColor: colorSuccess,
            isShowBadge: true,
            badgeTextCount: 12,
          ),
          16.widthBox,
          ExButtonDefault(
            backgroundColor: colorSuccess,
            label: 'Destructive',
            labelSize: 24,
          ),
        ]).scrollHorizontal(),

        // —————————————————————————————————————————————————————————————————————————————
        Divider().pSymmetric(v: 16),
        'Outline with Option'.text.bold.make().pOnly(bottom: 12),
        HStack([
          ExButtonOutline(
            label: faker.lorem.word(),
            labelColor: colorPrimary,
            leftIcon: Icon(Icons.info),
            isLabelBold: true,
          ),
          16.widthBox,
          ExButtonOutline(
            label: faker.lorem.word(),
            labelColor: colorSuccess,
            isShowBadge: true,
            badgeTextCount: 12,
          ),
          16.widthBox,
          ExButtonOutline(
            label: faker.lorem.word(),
            labelColor: colorDisclaimer,
            labelSize: 24,
          ),
        ]).scrollHorizontal(),

        // —————————————————————————————————————————————————————————————————————————————
        Divider().pSymmetric(v: 16),
        'Naked '.text.bold.make().pOnly(bottom: 12),
        HStack([
          TextButton(
            child: faker.lorem.word().text.make(),
            onPressed: () {},
          ),
          16.widthBox,
          TextButton(
            child: faker.lorem.word().text.color(colorError).make(),
            onPressed: () {},
          ),
          16.widthBox,
          TextButton.icon(
            onPressed: () {},
            icon: Icon(Icons.info),
            label: 'with icon'.text.color(colorError).make(),
          ),
        ]),
      ]).p16().scrollVertical(),
    );
  }
}
