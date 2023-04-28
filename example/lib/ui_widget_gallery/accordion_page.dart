import 'package:ex/ex.dart';

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class AccordionPage extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 'Accordion'.text.extraBold.size(16).make(),
      ),
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
            content: HStack(
              [
                ExAvatarView(source: 'url', userFullName: 'userFullName').pOnly(right: 12),
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
