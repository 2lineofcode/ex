import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

///   created               : Aditya Pratama
///   originalFilename      : ex_ui_loading
///   date                  : 24 Jun 2021
///   —————————————————————————————————————————————————————————————————————————————
///

class ExUiShimmerList extends StatelessWidget {
  const ExUiShimmerList({super.key, this.count = 10});

  final int? count;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: count ?? 10,
      separatorBuilder: (context, index) => Divider(),
      itemBuilder: (context, index) => buildCC(context),
    );
  }

  Widget buildCC(BuildContext context) {
    final primaryColor = Get.isDarkMode ? Vx.neutral700 : Colors.grey[200]!;
    final secondaryColor = Get.isDarkMode ? Vx.neutral800 : Colors.grey[300]!;

    return SizedBox(
      width: double.infinity,
      child: HStack(
        [
          VxCircle().wh(50, 50).shimmer(primaryColor: primaryColor, secondaryColor: secondaryColor),
          12.widthBox,
          VStack(
            [
              Container(width: 250, height: 12, color: primaryColor).cornerRadius(2).shimmer(primaryColor: primaryColor, secondaryColor: secondaryColor),
              4.heightBox,
              Container(width: 150, height: 10, color: primaryColor).cornerRadius(2).shimmer(primaryColor: primaryColor, secondaryColor: secondaryColor),
              4.heightBox,
              HStack(
                [
                  Container(height: 10, color: primaryColor).cornerRadius(2).shimmer(primaryColor: primaryColor, secondaryColor: secondaryColor).expand(),
                  12.widthBox,
                  Container(height: 10, color: primaryColor).cornerRadius(2).shimmer(primaryColor: primaryColor, secondaryColor: secondaryColor).expand(flex: 7),
                  12.widthBox,
                  Container(height: 10, color: primaryColor).cornerRadius(2).shimmer(primaryColor: primaryColor, secondaryColor: secondaryColor).expand(flex: 2),
                ],
              ),
            ],
          ).expand(),
          VxCircle().wh(12, 12).shimmer(primaryColor: primaryColor, secondaryColor: secondaryColor),
        ],
      ).p8(),
    );
  }
}
