import 'package:ex/ex.dart';
import 'package:flutter/material.dart';

class LogPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // log('output of: log');
    // logD('output of: logD');
    // logI('output of: logI');
    // logS('output of: logS');
    // logW('output of: logW');
    // logE('output of: logE');
    // print('output of: print');
    logJson({
      "data": {"message": "hello there!"}
    });
    logJson({
      "data": {"message": "hello there!"}
    });
    logJson({
      "data": {"message": "hello there!"}
    });
    logJson({
      "data": {"message": "hello there!"}
    });
    logJson(
      {
        "data": {"message": "hello there!"}
      },
      name: 'Get User Detail',
    );
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
              height: 300,
              child: Text(
                '''
logD('logD');
logI('logI');
logS('logS');
logW('logW');
logE('logE');
print('print');
log('log');
logJson({
  "data": {"message": "hello there!"}
});
    ''',
              ).p8(),
            ),
          ),

          /// 2
          ExAccordion(
            showAccordion: true,
            title: 'Output',
            content: Container(
              height: 200,
              child: 'Colorize log in terminal\n'
                  .richText
                  .withTextSpanChildren([
                    '[logD] color\n'.textSpan.blue300.make(),
                    '[logI] color\n'.textSpan.blue500.make(),
                    '[logS] color\n'.textSpan.green500.make(),
                    '[logW] color\n'.textSpan.orange500.make(),
                    '[logE] color\n'.textSpan.red500.make(),
                    '[print] color default\n'.textSpan.make(),
                    '[log] color white\n'.textSpan.make(),
                  ])
                  .make()
                  .pOnly(top: 8),
            ),
          ),
        ],
      ).p12().scrollVertical(),
    );
  }
}
