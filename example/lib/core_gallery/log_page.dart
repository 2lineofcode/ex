import 'package:ex/ex.dart';
import 'package:flutter/material.dart';

class LogPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    logD('message');
    logI('message');
    logW('message');
    logE('message');
    return Scaffold(
      appBar: AppBar(
        title: 'ExLog'.text.extraBold.size(16).make(),
      ),
      body: VStack(
        [
          /// 1
          ExAccordion(
            showAccordion: true,
            title: 'Type',
            content: Container(
              height: 100,
              child: Text(
                '''
logD('message');
logI('message');
logW('message');
logE('message');
    ''',
              ).p8(),
            ),
          ),

          /// 2
          ExAccordion(
            showAccordion: true,
            title: 'Output',
            content: Container(
              height: 120,
              child: Text(
                '''
[ExLog] 👻 | message
[ExLog] ℹ️ | message
[ExLog] 🟠 | message
[ExLog] 🔴 | message

    ''',
              ).p8(),
            ),
          ),
        ],
      ).p12().scrollVertical(),
    );
  }
}
