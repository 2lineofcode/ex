import 'package:ex/ex.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/index.dart';

class ErrorOrEmptyPage extends StatefulWidget {
  const ErrorOrEmptyPage({Key? key}) : super(key: key);

  @override
  State<ErrorOrEmptyPage> createState() => _ErrorOrEmptyPageState();
}

class _ErrorOrEmptyPageState extends State<ErrorOrEmptyPage> {
  var currentState = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: 'ErrorOrEmpty'.text.extraBold.size(16).make(),
          elevation: 0.5,
          leading: IconButton(icon: Icon(Icons.arrow_back_outlined), onPressed: () => Get.back()),
        ),
        body: VStack([
          HStack(
            [
              ExButtonOutline(
                label: 'Error Page',
                onPressed: () => setState(() => currentState = 0),
              ).expand(),
              12.widthBox,
              ExButtonOutline(
                label: 'Empty Page',
                onPressed: () => setState(() => currentState = 1),
              ).expand(),
            ],
          ).pOnly(bottom: 16),
          ExUiErrorOrEmpty(
            title: faker.lorem.word(),
            message: faker.lorem.sentence(),
            illustration: currentState == 0
                ? Icon(
                    Icons.error,
                    color: colorError,
                    size: 72,
                  )
                : Icon(
                    Icons.hourglass_empty,
                    color: colorInfo,
                    size: 72,
                  ),
            bgColor: colorPrimary[50],
            showBtnRetry: true,
            btnText: 'Coba Lagi',
            textColor: colorNeutral,
            textSize: 12,
            callback: () => ExSnackbar.info('clicked'),
          ).expand(),
        ]).p24());
  }
}
