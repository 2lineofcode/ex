import 'dart:ui';

import 'package:ex/ex.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import 'home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
      ),
      body: VStack([
        HStack([
          ExAvatarView(
            url: 'https://images.tokopedia.net/img/cache/500-square/product-1/2018/2/21/16071479/16071479_f6916610-62f8-4d7e-a7b9-3f9dcf37815f_700_700.jpg',
            name: 'a',
            borderColor: Colors.black,
          ).expand(),
          ExAvatarView(url: 'url', name: 'b', borderColor: Colors.black).expand(),
          ExImageView(
            url: 'https://images.tokopedia.net/img/cache/500-square/product-1/2018/2/21/16071479/16071479_f6916610-62f8-4d7e-a7b9-3f9dcf37815f_700_700.jpg',
          ).expand(),
          ExImageView(url: 'url').expand(),
          ExAvatarView(url: 'url', name: 'b', borderColor: Colors.black).expand(),
        ]),
        8.heightBox,
        HStack([
          ExButtonDefault(
            btnText: 'toErrorOrEmpty',
            withBadge: true,
            badgeCount: 222,
            onPress: () => context.push((context) => ErrorOrEmptyPage()),
          ),
          8.widthBox,
          ExButtonDefault(
            btnText: 'toLoadingPage',
            icon: Icons.facebook_outlined,
            withBadge: true,
            badgeCount: 222,
            onPress: () => context.push((context) => LoadingPage()),
          ),
          8.widthBox,
          ExButtonOutline(btnText: 'btnText', withBadge: true, badgeCount: 222),
          8.widthBox,
          ExButtonOutline(btnText: 'btnText', icon: Icons.facebook_outlined, withBadge: true, badgeCount: 222),
        ]).scrollHorizontal(),
        8.heightBox,
        ExDashLine(),
        8.heightBox,
        HStack([]).centered(),
        8.heightBox,
        ExProgress(value: 70, color1: Colors.red, color2: Colors.grey),
        8.heightBox,
        ExRadioButton(
          title: 'title',
          onPress: (v) {},
        ),
        8.heightBox,
        buildListTile(
          context: context,
          title: 'bottom sheet list',
          onTap: () => controller.list(),
        ),
        buildListTile(
          context: context,
          title: 'bottom sheet grid',
          onTap: () => controller.grid(),
        ),
        buildListTile(
          context: context,
          title: 'bottom sheet custom / content',
          onTap: () => controller.custom(),
        ),
        buildListTile(
          context: context,
          title: 'bottom sheet single input',
          onTap: () => controller.input(),
        ),
        HStack([
          buildListTile(
            context: context,
            title: 's',
            onTap: () => ExAlert.success(
              context: context,
              message: lorem(paragraphs: 1),
              messageTextAlign: TextAlign.left,
              showAsset: false,
            ),
          ).expand(),
          buildListTile(
            context: context,
            title: 'e',
            onTap: () => ExAlert.error(context: context, message: lorem(paragraphs: 1)),
          ).expand(),
          buildListTile(
            context: context,
            title: 'c',
            onTap: () => ExAlert.confirm(context: context, message: lorem(paragraphs: 1), title: 'question'),
          ).expand(),
        ]),
        buildListTile(
          context: context,
          title: 'alert loading',
          onTap: () => controller.loading(),
        ),
      ]).p16().scrollVertical(),
    );
  }
}

Widget buildListTile({
  required BuildContext context,
  required String title,
  Function()? onTap,
}) {
  return ListTile(
    title: title.text.make(),
    subtitle: lorem(words: 10).text.maxLines(2).overflow(TextOverflow.ellipsis).make(),
    dense: true,
    leading: ExAvatarView(url: 'url', name: 'name', width: 40, height: 40),
    onTap: onTap,
    minVerticalPadding: 16,
    trailing: Icon(Icons.navigate_next),
  ).card.make();
}

class ErrorOrEmptyPage extends StatelessWidget {
  const ErrorOrEmptyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: 'ErrorOrEmptyPage'.text.make()),
      body: VStack([
        ExUiErrorOrEmpty(
          message: 'error / empty message',
          title: 'Title',
          callback: () {},
        ).expand(),
      ]),
    );
  }
}

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: 'LoadingPage'.text.make()),
      body: VStack([ExUiLoading().expand()]),
    );
  }
}
