import 'package:ex/ex.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';

class TimeLineActivityPage extends GetView {
  const TimeLineActivityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 'TimeLine'.text.extraBold.size(16).make(),
        elevation: 0.5,
        leading: IconButton(icon: Icon(Icons.arrow_back_outlined), onPressed: () => Get.back()),
      ),
      body: VStack(
        [
          'Kegiatan Kelas'.text.bodyText1(context).bold.make().pOnly(bottom: 24),

          /// using example
          ExActivityTimeLine(
            index: 'sss',
            timelineName: '${faker.lorem.sentence()}',
            timelineAgo: '2 jam yang lalu',
            timelineIcon: Icon(Icons.star),
            showMoreMenu: false,
          ).pOnly(bottom: 12),

          /// example with loop
          for (var i = 0; i < 10; i++)
            ExActivityTimeLine(
              index: i.toString(),
              timelineName: '${faker.lorem.sentence()}',
              timelineAgo: '2 jam yang lalu',
              onMoreMenuClick: (s) => ExSnackbar.info('item index $s clicked'),
              content: Html(
                data: '''
<!DOCTYPE html>
<html>
<head>
// <style>
// body {background-color: powderblue;}
// h1   {color: blue;}
// p    {color: red;}
// </style>
</head>
<body>

<h1>This is a HTML View flutter</h1>
<p>so i assume, we can provide anything without limitation.</p>

</body>
</html>
''',
              ),
            ),
        ],
      ).p16().scrollVertical(),
    );
  }
}
