import 'package:ex/ex.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/index.dart';

class TimeLinePage extends GetView {
  const TimeLinePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 'TimeLine'.text.extraBold.size(16).make(),
        elevation: 0.5,
        leading: IconButton(icon: Icon(Icons.arrow_back_outlined), onPressed: () => Get.back()),
      ),
      body: VStack([
        /// 1
        TimelineTile(
          alignment: TimelineAlign.manual,
          lineXY: 0.0,
          isFirst: true,
          beforeLineStyle: LineStyle(color: colorNeutralLight, thickness: 1.5),
          indicatorStyle: IndicatorStyle(color: colorPrimary, height: 12, width: 12),
          endChild: Container(
            constraints: BoxConstraints(minHeight: 36),
            color: colorPrimaryLight,
            child: VStack([
              Text(faker.lorem.sentence(), style: TextStyle(fontSize: 13, color: colorNeutral)),
            ]).p12(),
          ).cornerRadius(16).pOnly(left: 12, bottom: 12),
        ),

        /// 2
        TimelineTile(
          alignment: TimelineAlign.manual,
          lineXY: 0.0,
          beforeLineStyle: LineStyle(color: colorNeutralLight, thickness: 1.5),
          indicatorStyle: IndicatorStyle(
            color: colorPrimary,
            height: 12,
            width: 12,
            indicator: Transform.translate(
              offset: Offset(-5, 0),
              child: Icon(Icons.star, color: colorPrimary),
            ),
          ),
          endChild: Container(
            constraints: BoxConstraints(minHeight: 36),
            color: colorPrimaryLight,
            child: VStack(
              [
                Text(faker.lorem.sentence(), style: TextStyle(fontSize: 13, color: colorNeutral)),
                Divider(),
                ExAvatarView(
                  url: 'https://picsum.photos/id/${random.integer(999, min: 100)}/200/300',
                  userFullName: 'a',
                  size: 32,
                ),
              ],
            ).p12(),
          ).cornerRadius(16).pOnly(left: 12, bottom: 12),
        ),

        /// 3
        TimelineTile(
          alignment: TimelineAlign.manual,
          lineXY: 0.0,
          isLast: true,
          beforeLineStyle: LineStyle(color: colorNeutralLight, thickness: 1.5),
          indicatorStyle: IndicatorStyle(color: colorPrimary, height: 12, width: 12),
          endChild: Container(
            constraints: BoxConstraints(minHeight: 36),
            color: colorPrimaryLight,
            child: VStack([
              Text(faker.lorem.sentence(), style: TextStyle(fontSize: 13, color: colorNeutral)),
            ]).p12(),
          ).cornerRadius(16).pOnly(left: 12, bottom: 12),
        ),
      ]).p24().scrollVertical(),
    );
  }
}
