import 'package:ex/ex.dart';
import 'package:example/core/index.dart';
import 'package:flutter/material.dart';

class DropdownPage extends StatelessWidget {
  const DropdownPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 'Dropdown'.text.bodyText1(context).bold.make(),
      ),
      body: VStack(
        [
          ExDropdown(
            hint: 'hintt..',
            textStyle: TextStyle(color: colorBlack),
            data: [
              ExKeyValue(key: 1, value: 'text, leading, trailing', icon: Icon(Icons.inbox), isSelected: true),
              ExKeyValue(key: 2, value: 'text, leading', icon: Icon(Icons.inbox)),
              ExKeyValue(key: 3, value: 'text only'),
            ],
            callback: (k, v) {
              ExSnackbar.info('$k - $v');
            },
          ),
        ],
      ).p16(),
    );
  }
}
