import 'package:ex/src/color.dart';
import 'package:flutter/material.dart';
import '../../ex.dart';

///   created               : Aditya Pratama
///   originalFilename      : ex_avatar_view
///   date                  : 21 Jun 2021
///   —————————————————————————————————————————————————————————————————————————————
///  <img width="200" alt="image" src="https://user-images.githubusercontent.com/36602270/169626607-f16c4fca-dce0-4095-b09c-c5ce915b649e.png">

class ExImageView extends StatelessWidget {
  const ExImageView({
    Key? key,
    required this.url,
    this.headers,
    this.height,
    this.width,
    this.size,
    this.borderColor,
    this.borderWidth,
    this.radius = 8,
    this.boxFit = BoxFit.cover,
    this.errorWidget,
  }) : super(key: key);

  final String url;
  final Map<String, String>? headers;
  final double? height;
  final double? width;
  final double? size;
  final Color? borderColor;
  final double? borderWidth;
  final double radius;
  final BoxFit boxFit;
  final Widget? errorWidget;

  @override
  Widget build(BuildContext context) {
    return ZStack(
      [
        Container(
          width: size ?? width,
          height: size ?? height,
          decoration: BoxDecoration(border: Border.all(color: borderColor ?? Colors.grey[300]!, width: borderWidth ?? 0.5)),
          child: url.isUrl!
              ? Image.network(
                  url,
                  headers: headers,
                  width: size ?? width,
                  height: size ?? height,
                  fit: boxFit,
                  isAntiAlias: true,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    }
                    return SizedBox(
                      width: 24,
                      height: 24,
                      child: Container(color: colorNeutral),
                    ).shimmer(primaryColor: colorNeutral[100]!, secondaryColor: colorNeutral[200]);
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Container(color: Colors.grey[300], child: errorWidget);
                  },
                )
              : Image.asset(
                  url,
                  width: size ?? width,
                  height: size ?? height,
                  fit: boxFit,
                  isAntiAlias: true,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(color: Colors.grey[300], child: errorWidget);
                  },
                ),
        ).cornerRadius(radius),
      ],
    );
  }
}
