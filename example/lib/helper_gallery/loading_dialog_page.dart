import 'package:ex/ex.dart';
import 'package:flutter/material.dart';

class LoadingDialogPage extends StatelessWidget {
  const LoadingDialogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ExAppBar(title: 'Loading Dialog'),
      body: VStack([
        // 1
        'ExLoading.show'.text.make().pOnly(bottom: 8),
        ExButtonOutline(
            label: 'ExLoading',
            width: double.infinity,
            onPressed: () async {
              ExLoading.show();
              await 20.seconds.delayed();
              ExLoading.dismiss();
            }),

        Divider().pSymmetric(v: 16),
      ]).p16().scrollVertical(),
    );
  }
}
