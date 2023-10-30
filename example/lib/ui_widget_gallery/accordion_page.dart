import 'package:ex_kit/ex.dart';

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class AccordionPage extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ExAppBar(title: 'Accordion'),
      body: VStack(
        [
          ExAccordion(
            title: faker.lorem.word(),
            content: faker.lorem.sentence().text.make(),
            showAccordion: true,
          ),
          ExAccordion(
            title: faker.lorem.word(),
            content: faker.lorem.sentence().text.make(),
            showAccordion: true,
          ),
          ExAccordion(
            title: faker.lorem.word(),
            content: faker.lorem.sentence().text.make(),
            showAccordion: false,
          ),
          ExAccordion(
            title: faker.lorem.word(),
            titleBorderRadius: BorderRadius.all(Radius.circular(0)),
            contentBorderRadius: BorderRadius.all(Radius.circular(0)),
            content: HStack(
              [
                ExAvatarView(
                  url: 'https://infomedia.tv/wp-content/uploads/2023/01/aa.jpg',
                  name: 'userFullName',
                ).onTap(() => ExImagePreview.showUrl(context, 'https://infomedia.tv/wp-content/uploads/2023/01/aa.jpg')).pOnly(right: 12),
                faker.lorem.word().text.make(),
              ],
            ),
            showAccordion: true,
          ),
        ],
      ),
    );
  }
}
