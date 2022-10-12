// ignore_for_file: must_be_immutable

import 'package:ex/ex.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

class BottomSheetPage extends StatelessWidget {
  BottomSheetPage({Key? key}) : super(key: key);

  // just example, in real case put this on controller & change to `.obs`
  String keyItemBottomSheetSelected = 'all';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 'BottomSheet'.text.extraBold.size(16).make(),
      ),
      body: VStack([
        // —————————————————————————————————————————————————————————————————————————————
        'Type Content'.text.bold.make().pOnly(bottom: 12),
        ExButtonOutline(
          label: 'Example Type Content',
          width: double.infinity,
          onPressed: () {
            ExBottomSheet.bottomSheetContentDialog(
              title: faker.lorem.word(),
              childrenWidget: VStack([
                faker.lorem.sentence().text.make(),
                4.heightBox,
                'line 2'.text.make(),
                Icon(Icons.android, size: 72),
                Divider().pSymmetric(v: 16),
                HStack([
                  ExButtonDefault(),
                  16.widthBox,
                  ExButtonDefault(),
                ]),
              ]),
            );
          },
        ),

        // —————————————————————————————————————————————————————————————————————————————
        Divider().pSymmetric(v: 16),
        'Type List '.text.bold.make().pOnly(bottom: 12),
        ExButtonOutline(
          label: 'Example Type List with Item Selected',
          width: double.infinity,
          onPressed: () {
            final data = <ExKeyValue>[
              ExKeyValue(key: 'all', value: 'Semua'),
              ExKeyValue(key: '124a68ef-a52b-41c6-a65c-902f56a488c7', value: faker.lorem.word()),
              ExKeyValue(key: '890b3a75-7a55-4d2a-9d4e-bb194fdcdc9a', value: faker.lorem.word()),
              ExKeyValue(key: '8670e932-93b5-4e54-8dba-dd20b409fe5c', value: faker.lorem.word()),
              ExKeyValue(key: '85c2cf01-a502-440f-925b-029fd16db4df', value: faker.lorem.word()),
              ExKeyValue(key: '870e4640-b887-44eb-a1c6-e78097ec7899', value: faker.lorem.word()),
              ExKeyValue(key: '8dfe58c7-2f48-4676-956a-d4f0c24ab444', value: faker.lorem.word()),
              ExKeyValue(key: '016d5d17-2617-4708-97f9-80174f2d94c2', value: faker.lorem.word()),
            ];

            ExBottomSheet.bottomSheetListWithSelectedDialog(
              data: data,
              keySelected: keyItemBottomSheetSelected,
              title: '${faker.lorem.word().toTitleCase}',
              callback: (k, v) {
                ExSnackbar.info('$v selected');
                keyItemBottomSheetSelected = k;
              },
            );
          },
        ),

        // —————————————————————————————————————————————————————————————————————————————
        Divider().pSymmetric(v: 16),
        'Without Title'.text.bold.make().pOnly(bottom: 12),
        ExButtonOutline(
          label: 'Type Without Title',
          width: double.infinity,
          onPressed: () {
            ExBottomSheet.bottomSheetContentDialogWithoutText(
              childrenWidget: VStack([
                faker.lorem.sentence().text.make().pSymmetric(v: 12),
                faker.lorem.sentence().text.make().pSymmetric(v: 12),
                faker.lorem.sentence().text.make().pSymmetric(v: 12),
                faker.lorem.sentence().text.make().pSymmetric(v: 12),
              ]),
            );
          },
        ),

        // —————————————————————————————————————————————————————————————————————————————
        Divider().pSymmetric(v: 16),
        'Custom & Dragable / FullSize'.text.bold.make().pOnly(bottom: 12),
        ExButtonOutline(
          label: 'Type Custom & Dragable / FullSize',
          width: double.infinity,
          onPressed: () {
            ExBottomSheet.bottomSheetCustomDialog(
              childrenWidget: VStack([
                faker.lorem.sentence().text.make().pSymmetric(v: 12),
                Placeholder(),
                faker.lorem.sentence().text.make().pSymmetric(v: 12),
              ]),
            );
          },
        ),
      ]).p16().scrollVertical(),
    );
  }
}
