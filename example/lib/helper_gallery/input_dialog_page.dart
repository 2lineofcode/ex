import 'package:ex/ex.dart';
import 'package:example/core/index.dart';
import 'package:faker/faker.dart';

import 'package:flutter/material.dart';

class InputDialogPage extends StatelessWidget {
  const InputDialogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 'Dialog'.text.extraBold.size(16).make(),
      ),
      body: VStack([
        // 1
        'ExDialog.singleInput'.text.make().pOnly(bottom: 8),
        ExButtonOutline(
          label: 'SINGLE INPUT',
          width: double.infinity,
          onPressed: () => ExDialog.singleInput(
            title: faker.lorem.sentence(),
            questionText: faker.lorem.word(),
            helperText: faker.lorem.sentence(),
            helperTextStyle: TextStyle(color: colorNeutral[300], fontSize: 10),
            btnOkText: 'Save',
            // initialValue: 'peler',
            inputHint: 'hint...',
            onYes: (output) => ExSnackbar.info(output),
          ),
        ),
        ExDivider().pSymmetric(v: 16),

        // 2
        'ExDialog.custom'.text.make().pOnly(bottom: 8),
        ExButtonOutline(
          label: 'CUSTOM',
          width: double.infinity,
          onPressed: () => ExDialog.custom(
            title: 'tess',
            content: VStack(
              [
                Text('-body-').pSymmetric(v: 12),
                ExAvatarView(url: 'url', userFullName: 'userFullName', size: 24),
                Text('jijnii').pSymmetric(v: 12),
                IconButton(onPressed: () {}, icon: Icon(Icons.next_plan)),
                ExButtonDefault(
                  label: 'Ok',
                ),
                ExButtonOutline(
                  label: 'Ok',
                ),
              ],
            ),
          ),
        ),
      ]).p16().scrollVertical(),
    );
  }
}