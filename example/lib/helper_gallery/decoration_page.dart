import 'package:ex/ex.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class DecorationPage extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 'Decoration'.text.extraBold.size(16).make(),
      ),
      body: VStack(
        [
          /// 1
          '# ExDecorator.commonBoxDecoration'.text.make().pSymmetric(v: 8),
          Container(
            width: double.infinity,
            decoration: ExDecorator.commonBoxDecoration(),
            child: VStack([
              faker.lorem.sentence().text.make(),
            ]).p12(),
          ),

          ExDivider().pSymmetric(v: 16),

          /// 2
          '# ExDecorator.commonBoxDecorationWithShadow'.text.make().pSymmetric(v: 8),
          Container(
            width: double.infinity,
            decoration: ExDecorator.commonBoxDecorationWithShadow(),
            child: VStack([
              faker.lorem.sentence().text.make(),
            ]).p12(),
          ),

          ExDivider().pSymmetric(v: 16),

          /// 3
          '# ExDecorator.boxBottomSheetRadiusDecoration'.text.make().pSymmetric(v: 8),
          Container(
            width: double.infinity,
            decoration: ExDecorator.boxBottomSheetRadiusDecoration(radius: 8),
            child: VStack([
              faker.lorem.sentence().text.make(),
            ]).p12(),
          ),
        ],
      ).p16(),
    );
  }
}
