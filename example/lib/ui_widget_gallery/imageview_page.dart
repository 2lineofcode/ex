import 'package:ex_kit/ex.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

class ImageViewPage extends StatelessWidget {
  const ImageViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 'ImageView'.text.extraBold.size(16).make(),
      ),
      body: VStack([
        '24px'.text.bold.make().pOnly(bottom: 12),
        HStack([
          ExImageView(source: '', size: 24).pOnly(right: 12),
          ExImageView(source: '', size: 24).pOnly(right: 12),
          ExImageView(
                  source:
                      'https://picsum.photos/id/${random.integer(999, min: 100)}/200/300',
                  size: 24)
              .pOnly(right: 12),
          ExImageView(
                  source:
                      'https://picsum.photos/id/${random.integer(999, min: 100)}/200/300',
                  size: 24)
              .pOnly(right: 12),
          ExImageView(
                  source:
                      'https://picsum.photos/id/${random.integer(999, min: 100)}/200/300',
                  size: 24)
              .pOnly(right: 12),
        ]).scrollHorizontal(),
        Divider().pSymmetric(v: 16),
        '32px'.text.bold.make().pOnly(bottom: 12),
        HStack([
          ExImageView(source: '', size: 32).pOnly(right: 12),
          ExImageView(source: '', size: 32).pOnly(right: 12),
          ExImageView(
                  source:
                      'https://picsum.photos/id/${random.integer(999, min: 100)}/200/300',
                  size: 32)
              .pOnly(right: 12),
          ExImageView(
                  source:
                      'https://picsum.photos/id/${random.integer(999, min: 100)}/200/300',
                  size: 32)
              .pOnly(right: 12),
          ExImageView(
                  source:
                      'https://picsum.photos/id/${random.integer(999, min: 100)}/200/300',
                  size: 32)
              .pOnly(right: 12),
        ]).scrollHorizontal(),
        Divider().pSymmetric(v: 16),
        '40px'.text.bold.make().pOnly(bottom: 12),
        HStack([
          ExImageView(
            source: 'assets/images/sample.svg',
            size: 40,
            backgroundColor: Vx.randomPrimaryColor,
          ).pOnly(right: 12),
          ExImageView(source: '', size: 40).pOnly(right: 12),
          ExImageView(
                  source:
                      'https://picsum.photos/id/${random.integer(999, min: 100)}/200/300',
                  size: 40)
              .pOnly(right: 12),
          ExImageView(
                  source:
                      'https://picsum.photos/id/${random.integer(999, min: 100)}/200/300',
                  size: 40)
              .pOnly(right: 12),
          ExImageView(
                  source:
                      'https://picsum.photos/id/${random.integer(999, min: 100)}/200/300',
                  size: 40)
              .pOnly(right: 12),
        ]).scrollHorizontal(),
        Divider().pSymmetric(v: 16),
        '48px'.text.bold.make().pOnly(bottom: 12),
        HStack([
          ExImageView(source: '', size: 48).pOnly(right: 12),
          ExImageView(source: '', size: 48).pOnly(right: 12),
          ExImageView(
                  source:
                      'https://picsum.photos/id/${random.integer(999, min: 100)}/200/300',
                  size: 48)
              .pOnly(right: 12),
          ExImageView(
                  source:
                      'https://picsum.photos/id/${random.integer(999, min: 100)}/200/300',
                  size: 48)
              .pOnly(right: 12),
          ExImageView(
                  source:
                      'https://picsum.photos/id/${random.integer(999, min: 100)}/200/300',
                  size: 48)
              .pOnly(right: 12),
        ]).scrollHorizontal(),
        Divider().pSymmetric(v: 16),
        '56px'.text.bold.make().pOnly(bottom: 12),
        HStack([
          ExImageView(source: '', size: 56).pOnly(right: 12),
          ExImageView(source: '', size: 56).pOnly(right: 12),
          ExImageView(
                  source:
                      'https://picsum.photos/id/${random.integer(999, min: 100)}/200/300',
                  size: 56)
              .pOnly(right: 12),
          ExImageView(
                  source:
                      'https://picsum.photos/id/${random.integer(999, min: 100)}/200/300',
                  size: 56)
              .pOnly(right: 12),
          ExImageView(
                  source:
                      'https://picsum.photos/id/${random.integer(999, min: 100)}/200/300',
                  size: 56)
              .pOnly(right: 12),
        ]).scrollHorizontal(),
      ]).p16().scrollVertical(),
    );
  }
}
