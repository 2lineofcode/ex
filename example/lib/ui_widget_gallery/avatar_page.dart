import 'package:ex_kit/ex.dart';
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
        'network: svg'.text.bold.make().pOnly(bottom: 12),
        HStack([
          for (var i = 0; i < counter; i++)
            ExAvatarView(
              name: faker.person.name(),
              source:
                  'https://app.bibit.id/assets/images/portfolio/green/dark/${i + 1}.svg',
              size: 48,
              borderColor: Vx.randomPrimaryColor,
              borderWidth: ExRandom.between(1, 6).toDouble(),
              bgColor: Vx.randomPrimaryColor,
              textSize: ExRandom.between(12, 24).toDouble(),
              textColor: Vx.randomPrimaryColor,
            ).pOnly(right: 12),
        ]).scrollHorizontal(),
        Divider().pSymmetric(v: 16),

        ///
        'network: png'.text.bold.make().pOnly(bottom: 12),
        HStack([
          for (var i = 0; i < counter; i++)
            ExAvatarView(
              name: faker.person.name(),
              source:
                  'https://picsum.photos/id/${random.integer(999, min: 100)}/200/300',
              size: 32,
              borderColor: Vx.randomPrimaryColor,
              borderWidth: ExRandom.between(1, 6).toDouble(),
              bgColor: Vx.randomPrimaryColor,
              textSize: ExRandom.between(12, 24).toDouble(),
              textColor: Vx.randomPrimaryColor,
            ).onTap(() {
              ExImagePreview.showUrl('https://picsum.photos/id/4/200/300',
                  tag: 'dash');
            }).pOnly(right: 12),
        ]).scrollHorizontal(),
        Divider().pSymmetric(v: 16),

        ///
        'network: error'.text.bold.make().pOnly(bottom: 12),
        HStack([
          for (var i = 0; i < counter; i++)
            ExAvatarView(
              name: faker.person.name(),
              source: 'http://jnb.com/',
              size: 40,
              borderColor: Vx.randomPrimaryColor,
              borderWidth: ExRandom.between(1, 6).toDouble(),
              bgColor: Vx.randomPrimaryColor,
              textSize: ExRandom.between(12, 24).toDouble(),
              textColor: Vx.randomPrimaryColor,
            ).pOnly(right: 12),
        ]).scrollHorizontal(),
        Divider().pSymmetric(v: 16),

        ///
        'null/empty'.text.bold.make().pOnly(bottom: 12),
        HStack([
          for (var i = 0; i < counter; i++)
            ExAvatarView(
              name: faker.person.name(),
              source: '',
              size: 48,
              borderColor: Vx.randomPrimaryColor,
              borderWidth: ExRandom.between(1, 6).toDouble(),
              bgColor: Vx.randomPrimaryColor,
              textSize: ExRandom.between(12, 24).toDouble(),
              textColor: Vx.randomPrimaryColor,
            ).pOnly(right: 12),
        ]).scrollHorizontal(),
        Divider().pSymmetric(v: 16),

        ///
        'network: complex svg'.text.bold.make().pOnly(bottom: 12),
        HStack([
          for (var i = 0; i < counter; i++)
            ExAvatarView(
              name: faker.person.name(),
              source:
                  'https://s3-ap-southeast-1.amazonaws.com/static.pintu.co.id/assets/images/logo/circle_QNT.svg',
              size: 56,
              borderColor: Vx.randomPrimaryColor,
              borderWidth: ExRandom.between(1, 6).toDouble(),
              bgColor: Vx.randomPrimaryColor,
              textSize: ExRandom.between(12, 24).toDouble(),
              textColor: Vx.randomPrimaryColor,
            ).pOnly(right: 12),
        ]).scrollHorizontal(),

        Divider().pSymmetric(v: 16),

        ///
        'assets: jpg/png'.text.bold.make().pOnly(bottom: 12),
        HStack([
          for (var i = 0; i < counter; i++)
            ExAvatarView(
              name: faker.person.name(),
              source: 'assets/images/sample.png',
              size: 72,
              borderColor: Vx.randomPrimaryColor,
              borderWidth: ExRandom.between(1, 6).toDouble(),
              bgColor: Vx.randomPrimaryColor,
              textSize: ExRandom.between(12, 24).toDouble(),
              textColor: Vx.randomPrimaryColor,
            ).pOnly(right: 12),
        ]).scrollHorizontal(),

        Divider().pSymmetric(v: 16),

        ///
        'assets: svg'.text.bold.make().pOnly(bottom: 12),
        HStack([
          for (var i = 0; i < counter; i++)
            ExAvatarView(
              name: faker.person.name(),
              source: 'assets/images/sample.svg',
              size: 120,
              borderColor: Vx.randomPrimaryColor,
              borderWidth: ExRandom.between(1, 6).toDouble(),
              bgColor: Vx.randomPrimaryColor,
              textSize: ExRandom.between(12, 24).toDouble(),
              textColor: Vx.randomPrimaryColor,
            ).pOnly(right: 12),
        ]).scrollHorizontal(),
      ]).p16().scrollVertical(),
    );
  }
}
