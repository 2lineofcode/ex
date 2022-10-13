import 'package:ex/ex.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

import '../core/index.dart';

class TextFieldPage extends StatelessWidget {
  const TextFieldPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 'TextField'.text.extraBold.size(16).make(),
      ),
      body: VStack([
        'TextField Normal'.text.bold.make().pOnly(bottom: 12),
        ExTextField(
          hint: faker.lorem.sentence(),
        ),

        // —————————————————————————————————————————————————————————————————————————————
        Divider().pSymmetric(v: 16),
        'TextField with Prefix Icon & Validator'.text.bold.make().pOnly(bottom: 12),
        ExTextField(
          prefixIcon: Icons.verified_user,
          hint: faker.lorem.sentence(),
          validator: (password) {
            if (password != null && password.length < 6) {
              return 'Password harus lebih besar dari 6 huruf';
            }
            return null;
          },
          labelText: '* required',
          labelTextColor: colorError,
        ),
        Divider().pSymmetric(v: 16),

        'TextField with Suffix Icon'.text.bold.make().pOnly(bottom: 12),
        ExTextField(
          suffixIcon: Icons.search,
          hint: 'Search',
        ),
        Divider().pSymmetric(v: 16),

        'TextField with Prefix & Suffix Icon'.text.bold.make().pOnly(bottom: 12),
        ExTextField(
          prefixIcon: Icons.account_circle,
          suffixIcon: Icons.search,
          hint: 'Search Account',
        ),

        // —————————————————————————————————————————————————————————————————————————————
        Divider().pSymmetric(v: 16),
        'TextField MultiLine'.text.bold.make().pOnly(bottom: 12),
        ExTextFieldMultiline(
          hint: faker.lorem.sentence(),
          maxLine: 6,
        ),

        // —————————————————————————————————————————————————————————————————————————————
        Divider().pSymmetric(v: 16),
        'Date Picker'.text.bold.make().pOnly(bottom: 12),
        ExTextField(
          prefixIcon: Icons.date_range,
          hint: faker.lorem.sentence(),
          enabled: false,
        ).onInkTap(() {
          //.
        }),
      ]).p16().scrollVertical(),
    );
  }
}
