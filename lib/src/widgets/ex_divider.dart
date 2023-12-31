import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

///   <img width="376" alt="image" src="https://user-images.githubusercontent.com/36602270/169745959-c2b1cc2a-74eb-49a9-83bf-811e8c1d1a65.png">
enum ExDividerMode { line, dash }

enum ExDividerTextMode {
  left,
  center,
  right,
}

class ExDivider extends StatelessWidget {
  const ExDivider({
    super.key,
    this.label,
    this.textMode = ExDividerTextMode.center,
    this.dividerMode = ExDividerMode.dash,
  });

  final String? label;
  final ExDividerMode dividerMode;
  final ExDividerTextMode textMode;

  @override
  Widget build(BuildContext context) {
    // if (label == null) {
    //   return Divider();
    // }

    // line
    if (label != null &&
        dividerMode == ExDividerMode.line &&
        textMode == ExDividerTextMode.center) {
      return HStack([
        Divider().expand(),
        '$label'.text.make().pSymmetric(h: 16),
        Divider().expand(),
      ]);
    } else if (label != null &&
        dividerMode == ExDividerMode.line &&
        textMode == ExDividerTextMode.left) {
      return HStack([
        '$label'.text.make(),
        Divider().pOnly(left: 12).expand(),
      ]);
    } else if (label != null &&
        dividerMode == ExDividerMode.line &&
        textMode == ExDividerTextMode.right) {
      return HStack([
        Divider().pOnly(right: 12).expand(),
        '$label'.text.make(),
      ]);
    }

    // dash
    else if (label != null &&
        dividerMode == ExDividerMode.dash &&
        textMode == ExDividerTextMode.center) {
      return HStack([
        buildDash().expand(),
        '$label'.text.make().pSymmetric(h: 16),
        buildDash().expand(),
      ]);
    } else if (label != null &&
        dividerMode == ExDividerMode.dash &&
        textMode == ExDividerTextMode.left) {
      return HStack([
        '$label'.text.make(),
        buildDash().pOnly(left: 16).expand(),
      ]);
    } else if (label != null &&
        dividerMode == ExDividerMode.dash &&
        textMode == ExDividerTextMode.right) {
      return HStack([
        buildDash().pOnly(right: 16).expand(),
        '$label'.text.make(),
      ]);
    }

    // // DEFAULT
    else if (dividerMode == ExDividerMode.line) {
      return Divider();
    } else if (dividerMode == ExDividerMode.dash) {
      return buildDash();
    } else {
      return Divider();
    }
  }

  Row buildDash() {
    return Row(
      children: List.generate(
        150 ~/ 2,
        (index) => Expanded(
          child: Container(
            color: index.isOdd ? Colors.transparent : Colors.grey,
            height: 1,
          ),
        ),
      ),
    );
  }
}
