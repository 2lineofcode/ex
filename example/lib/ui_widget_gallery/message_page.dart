import 'package:ex/ex.dart';
import 'package:example/core/index.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

class MessagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: VStack(
        [
          'top widget'.text.make(),
          ExMessage(
            content: VStack([
              'Info'.text.bold.orange500.make().pSymmetric(v: 8),
              faker.lorem.sentence().text.maxLines(2).ellipsis.make(),
            ]),
            // fillColor: colorPrimaryLight,
            // borderColor: colorPrimary,
            // borderRadius: 8,
          ).pSymmetric(v: 12),
          'bottom widget'.text.make(),
          ExMessage(
            content: VStack([
              'Info'.text.bold.blue700.make().pSymmetric(v: 8),
              faker.lorem.sentence().text.maxLines(2).ellipsis.make(),
            ]),
            fillColor: colorPrimaryLight,
            borderColor: colorPrimary,
          ).pSymmetric(v: 12),
        ],
      ).p16(),
    );
  }
}
