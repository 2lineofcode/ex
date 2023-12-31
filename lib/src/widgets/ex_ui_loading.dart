import 'package:flutter/material.dart';
import '../../ex.dart';

///   <img width="122" alt="image" src="https://user-images.githubusercontent.com/36602270/169626852-b050bc69-e3a2-422f-b3ff-0e7644597526.png">
class ExUiLoading extends StatelessWidget {
  const ExUiLoading({
    super.key,
    this.bgColor,
    this.child,
    this.message,
  });

  final Color? bgColor;
  final Widget? child;
  final Widget? message;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgColor,
      height: context.mq.size.height,
      width: context.mq.size.width,
      child: Center(
        child: VStack(
          [
            child ?? ExRefreshIndicator().centered(),
            16.heightBox,
            message ??
                'Please wait...'.text.align(TextAlign.center).makeCentered(),
          ],
        ),
      ),
    );
  }
}
