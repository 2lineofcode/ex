import 'package:ex/ex.dart';
import 'package:flutter/material.dart';

enum ExContainerType { box, shadow }

class ExContainer extends StatelessWidget {
  const ExContainer({
    super.key,
    this.borderColor,
    this.borderRadius,
    this.borderWidth,
    this.fillColor,
    this.constraints,
    this.height,
    this.width,
    this.padding,
    this.type = ExContainerType.box,
    this.child,
  });

  final Color? borderColor;
  final double? borderRadius;
  final double? borderWidth;
  final Color? fillColor;
  final Widget? child;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final BoxConstraints? constraints;
  final ExContainerType? type;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.all(0),
      child: Container(
        decoration: type == ExContainerType.box
            ? ExDecorator.box(
                borderColor: borderColor,
                borderRadius: borderRadius ?? 12,
                fillColor: fillColor,
                borderWidth: borderWidth,
              )
            : ExDecorator.shadow(
                borderColor: borderColor,
                fillColor: fillColor ?? Colors.white,
                borderRadius: borderRadius ?? 12,
              ),
        width: width,
        height: height,
        constraints: constraints,
        child: child,
      ),
    );
  }
}
