import 'package:dart_code_viewer2/dart_code_viewer2.dart';
import 'package:ex/ex.dart';
import 'package:flutter/material.dart';

class ExtIntPage extends StatelessWidget {
  const ExtIntPage({super.key});

  @override
  Widget build(BuildContext context) {
    10.forEach((index) {
      // do something...
    });
    return Scaffold(
      appBar: AppBar(
        title: 'Extention on int'.text.extraBold.size(16).make(),
      ),
      body: VStack(
        [
          /// 1
          ExAccordion(
            showAccordion: true,
            title: 'forEach',
            content: Container(
              height: 100,
              child: DartCodeViewer(
                '''
10.forEach((index) {
  // do something 10 times...
});
    ''',
                showCopyButton: false,
              ).p8(),
            ),
          ),

          /// 2
          ExAccordion(
            showAccordion: true,
            title: 'map',
            content: Container(
              height: 100,
              child: DartCodeViewer(
                '''
10.map((index) {
  // do something 10 times...
});
    ''',
                showCopyButton: false,
              ).p8(),
            ),
          ),
        ],
      ).p12().scrollVertical(),
    );
  }
}
