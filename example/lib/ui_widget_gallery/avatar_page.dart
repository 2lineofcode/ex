import 'package:ex/ex.dart';
import 'package:example/core/index.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  const AvatarPage({Key? key}) : super(key: key);
  final int counter = 6;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 'Avatar'.text.extraBold.size(16).make(),
      ),
      body: VStack([
        ///
        'from assets'.text.bold.make().pOnly(bottom: 12),
        HStack([
          for (var i = 0; i < counter; i++)
            ExAvatarView(
              name: faker.person.name(),
              source:
                  'https://app.bibit.id/assets/images/portfolio/green/dark/${i + 1}.svg',
              package: 'ex',
              size: 48,
            ).pOnly(right: 12),
        ]).scrollHorizontal(),
        Divider().pSymmetric(v: 16),

        ///
        '32px'.text.bold.make().pOnly(bottom: 12),
        HStack([
          for (var i = 0; i < counter; i++)
            Hero(
              tag: 'dash',
              child: ExAvatarView(
                name: faker.person.name(),
                source: 'https://picsum.photos/id/4/200/300',
                size: 32,
              ).onTap(() {
                ExImagePreview.showUrl('https://picsum.photos/id/4/200/300', tag: 'dash');
              }).pOnly(right: 12),
            ),
        ]).scrollHorizontal(),
        Divider().pSymmetric(v: 16),

        ///
        '40px'.text.bold.make().pOnly(bottom: 12),
        HStack([
          for (var i = 0; i < counter; i++)
            ExAvatarView(
              name: faker.person.name(),
              source: 'https://asda.com',
              bgColor: Colors.black12,
              textColor: colorPrimary[50],
              size: 40,
            ).pOnly(right: 12),
        ]).scrollHorizontal(),
        Divider().pSymmetric(v: 16),

        ///
        '48px'.text.bold.make().pOnly(bottom: 12),
        HStack([
          for (var i = 0; i < counter; i++)
            ExAvatarView(
              name: faker.person.name(),
              source:
                  'https://picsum.photos/id/${random.integer(999, min: 100)}/200/300',
              size: 48,
            ).pOnly(right: 12),
        ]).scrollHorizontal(),
        Divider().pSymmetric(v: 16),

        ///
        '56px'.text.bold.make().pOnly(bottom: 12),
        HStack([
          for (var i = 0; i < counter; i++)
            ExAvatarView(
              name: faker.person.name(),
              source:
                  'https://picsum.photos/id/${random.integer(999, min: 100)}/200/300',
              size: 56,
            ).pOnly(right: 12),
        ]).scrollHorizontal(),

        Divider().pSymmetric(v: 16),

        ///
        '72px'.text.bold.make().pOnly(bottom: 12),
        HStack([
          for (var i = 0; i < counter; i++)
            ExAvatarView(
              name: faker.person.name(),
              source:
                  'https://picsum.photos/id/${random.integer(999, min: 100)}/200/300',
              size: 72,
            ).pOnly(right: 12),
        ]).scrollHorizontal(),

        Divider().pSymmetric(v: 16),

        ///
        '120px'.text.bold.make().pOnly(bottom: 12),
        HStack([
          for (var i = 0; i < counter; i++)
            ExAvatarView(
              name: faker.person.name(),
              source:
                  'https://picsum.photos/id/${random.integer(999, min: 100)}/200/300',
              size: 120,
            ).pOnly(right: 12),
        ]).scrollHorizontal(),
      ]).p16().scrollVertical(),
    );
  }
}
