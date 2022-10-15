import 'package:ex/ex.dart';
import 'package:flutter/material.dart';

class TablePage extends StatelessWidget {
  const TablePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 'Table'.text.bodyText1(context).bold.make(),
      ),
      body: VStack(
        [

        ],
      ).p16(),
    );
  }
}
