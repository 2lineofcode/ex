import 'package:ex/ex.dart';
import 'package:flutter/material.dart';

class DividerPage extends StatelessWidget {
  const DividerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 'Divider'.text.extraBold.size(16).make(),
      ),
      body: VStack([
        'Divider Default'.text.bold.make().pOnly(bottom: 12),
        ExDivider(),
        32.heightBox,

        'Divider LEFT'.text.bold.make().pOnly(bottom: 12),
        ExDivider(label: 'LEFT', textMode: ExDividerTextMode.left),
        32.heightBox,

        'Divider CENTER'.text.bold.make().pOnly(bottom: 12),
        ExDivider(label: 'CENTER'),
        32.heightBox,

        'Divider RIGHT'.text.bold.make().pOnly(bottom: 12),
        ExDivider(label: 'RIGHT', textMode: ExDividerTextMode.right),
        32.heightBox,

        // —————————————————————————————————————————————————————————————————————————————

        'Divider Dash Default'.text.bold.make().pOnly(bottom: 12),
        ExDivider(dividerMode: ExDividerMode.dash),
        32.heightBox,

        'Divider Dash LEFT'.text.bold.make().pOnly(bottom: 12),
        ExDivider(
            label: 'LEFT',
            textMode: ExDividerTextMode.left,
            dividerMode: ExDividerMode.dash),
        32.heightBox,

        'Divider Dash CENTER'.text.bold.make().pOnly(bottom: 12),
        ExDivider(label: 'CENTER', dividerMode: ExDividerMode.dash),
        32.heightBox,

        'Divider Dash RIGHT'.text.bold.make().pOnly(bottom: 12),
        ExDivider(
            label: 'RIGHT',
            textMode: ExDividerTextMode.right,
            dividerMode: ExDividerMode.dash),
        32.heightBox,
      ]).p16().scrollVertical(),
    );
  }
}
