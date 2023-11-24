import 'package:ex/ex.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/index.dart';

class ProgressPage extends StatefulWidget {
  const ProgressPage({Key? key}) : super(key: key);

  @override
  State<ProgressPage> createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> {
  var counter = ExRandom.between(10, 99);
  var counter2 = ExRandom.between(10, 99);
  var counter3 = 0;
  var counter4 = ExRandom.between(10, 99);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 'Progress'.text.extraBold.size(16).make(),
        elevation: 0.5,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_outlined), onPressed: () => Get.back()),
      ),
      body: VStack([
        /// 1
        HStack(
          [
            ExProgress(
              value: counter,
              color1: colorPrimary,
              color2: colorPrimaryLight,
            ).expand(),
            '$counter%'.text.make().pOnly(left: 12),
          ],
        ),
        12.heightBox,

        /// 2
        HStack(
          [
            ExProgress(
              value: counter2,
              color1: colorAccent,
              color2: colorAccentLight,
            ).expand(),
            '$counter2%'.text.make().pOnly(left: 12),
          ],
        ),
        12.heightBox,

        /// 3
        HStack(
          [
            ExProgress(
              value: counter3,
              color1: colorSuccess,
              color2: colorSuccessLight,
            ).expand(),
            '$counter3%'.text.make().pOnly(left: 12),
          ],
        ),
        12.heightBox,

        /// 4
        HStack(
          [
            ExProgress(
              value: counter4,
              color1: colorError,
              color2: colorErrorLight,
            ).expand(),
            '$counter4%'.text.make().pOnly(left: 12),
          ],
        ),
        12.heightBox,

        ExButtonOutline(
          width: double.infinity,
          label: 're-render',
          onPressed: () {
            setState(() {
              counter = ExRandom.between(10, 90);
              counter2 = ExRandom.between(10, 90);
              counter3 = ExRandom.between(10, 90);
              counter4 = ExRandom.between(10, 90);
              debugPrint('counter: $counter');
            });
          },
        ).p16(),
      ]).p24().scrollVertical(),
    );
  }
}
