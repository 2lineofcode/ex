import 'package:ex/ex.dart';
import 'package:faker/faker.dart';

import 'package:flutter/material.dart';

class DialogPage extends StatelessWidget {
  const DialogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ExAppBar(title: 'Dialog'),
      body: VStack([
        // 1
        'ExDialog.singleInput'.text.make().pOnly(bottom: 8),
        ExButtonOutline(
          label: 'SINGLE INPUT',
          width: double.infinity,
          onPressed: () => ExDialog.singleInput(
            title: '${faker.lorem.sentences(2)}',
            body: '${faker.lorem.sentence()}',
            hint: 'hint...',
            initialValue: 'peler',
            onYes: (output) => ExSnackbar.info(output),
          ),
        ),
        Divider().pSymmetric(v: 16),

        // 2
        'ExDialog.custom'.text.make().pOnly(bottom: 8),
        ExButtonOutline(
          label: 'CUSTOM',
          width: double.infinity,
          onPressed: () => ExDialog.custom(
            title: 'tess',
            content: VStack(
              [
                Text('-body-').pOnly(bottom: 12),
                ExAvatarView(url: 'url', name: 'userFullName', size: 24),
                Text('jijnii').pSymmetric(v: 12),
                IconButton(onPressed: () {}, icon: Icon(Icons.next_plan)),
                ExButtonElevated(
                  label: 'Ok',
                ),
                ExButtonOutline(
                  label: 'Ok',
                ),
              ],
            ),
          ),
        ),

        Divider().pSymmetric(v: 16),
      ]).p16().scrollVertical(),
    );
  }
}