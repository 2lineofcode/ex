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
  var counter = randomBetween(10, 99);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 'Progress'.text.extraBold.size(16).make(),
        elevation: 0.5,
        leading: IconButton(icon: Icon(Icons.arrow_back_outlined), onPressed: () => Get.back()),
      ),
      body: VStack([
        ///
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

        ExButtonOutline(
          width: double.infinity,
          label: 're-render',
          onPressed: () {
            setState(() {
              counter = randomBetween(10, 90);
              debugPrint('counter: $counter');
            });
          },
        ).p16(),
      ]).p24().scrollVertical(),
    );
  }
}
