import 'package:flutter/material.dart';
import '../../ex.dart';

///   created               : Aditya Pratama
///   originalFilename      : ex_ui_loading
///   date                  : 24 Jun 2021
///   —————————————————————————————————————————————————————————————————————————————
///   <img width="122" alt="image" src="https://user-images.githubusercontent.com/36602270/169626852-b050bc69-e3a2-422f-b3ff-0e7644597526.png">

class ExUiLoading extends StatelessWidget {
  const ExUiLoading({
    super.key,
    this.child,
    this.message,
  });

  final Widget? child;
  final Widget? message;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: context.mq.size.height,
      width: context.mq.size.width,
      child: Center(
        child: VStack(
          [
            child ?? ExProgressBar(color: Theme.of(context).primaryColor, size: 32).centered(),
            30.heightBox,
            message ?? 'Please wait...'.text.makeCentered(),
          ],
        ),
      ),
    );
  }
}
