import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../ex.dart';

///   created               : Aditya Pratama
///   originalFilename      : ex_avatar_view
///   date                  : 21 Jun 2021
///   —————————————————————————————————————————————————————————————————————————————
///  <img width="200" alt="image" src="https://user-images.githubusercontent.com/36602270/169626607-f16c4fca-dce0-4095-b09c-c5ce915b649e.png">

class ExImageView extends StatelessWidget {
  const ExImageView({
    required this.url,
    super.key,
    this.headers,
    this.height,
    this.width,
    this.size,
    this.borderColor = Colors.transparent,
    this.backgroundColor = Colors.transparent,
    this.borderWidth = 1,
    this.radius = 8,
    this.boxFit = BoxFit.cover,
    this.errorWidget,
    this.padding,
    this.package,
  });

  final String url;
  final Map<String, String>? headers;
  final double? height;
  final double? width;
  final double? size;
  final double? padding;
  final Color? borderColor;
  final Color? backgroundColor;
  final double? borderWidth;
  final double radius;
  final BoxFit boxFit;
  final Widget? errorWidget;
  final String? package;

  @override
  Widget build(BuildContext context) {
    if (url.isEmptyOrNull) {
      return ExContainer(
        width: size ?? width,
        height: size ?? height,
        fillColor: Colors.grey[300],
        borderRadius: radius,
        child: Icon(Icons.image_not_supported_rounded, color: Vx.neutral500, size: 18),
      );
    }

    if (url.isURL) {
      return ZStack(
        [
          ExContainer(
            width: size ?? width,
            height: size ?? height,
            fillColor: backgroundColor,
            borderColor: borderColor,
            borderRadius: radius,
            borderWidth: borderWidth,
            child: CachedNetworkImage(
              imageUrl: url,
              imageBuilder: (context, imageProvider) => Container(decoration: BoxDecoration(image: DecorationImage(image: imageProvider, fit: boxFit))),
              width: size ?? width,
              height: size ?? height,
              httpHeaders: headers,
              placeholder: (context, url) => ExContainer(
                width: size ?? width,
                height: size ?? height,
                fillColor: Colors.grey[300],
                borderRadius: radius,
                child: Icon(Icons.image_not_supported_rounded, color: Vx.neutral500, size: 18),
              ).shimmer(primaryColor: Vx.neutral100, secondaryColor: Vx.neutral200),
              errorWidget: (context, url, error) => Container(color: Colors.grey[300], child: errorWidget ?? Icon(Icons.image_not_supported_rounded, color: Vx.neutral500, size: 18)),
            ).p(padding ?? 0),
          ).cornerRadius(radius),
        ],
      );
    } else {
      return ZStack(
        [
          ExContainer(
            width: size ?? width,
            height: size ?? height,
            fillColor: backgroundColor,
            borderColor: borderColor,
            borderWidth: borderWidth,
            borderRadius: radius,
            child: url.contains('.svg')
                ? SvgPicture.asset(
                    url,
                    width: size ?? width,
                    height: size ?? height,
                    fit: boxFit,
                    placeholderBuilder: (context) => ExProgressBar(color: Theme.of(context).primaryColor, size: 12).centered(),
                    package: package,
                  ).p(padding ?? 0)
                : Image.asset(
                    url,
                    width: size ?? width,
                    height: size ?? height,
                    fit: boxFit,
                    isAntiAlias: true,
                    errorBuilder: (context, error, stackTrace) => Container(color: Colors.grey[300], child: errorWidget),
                    package: package,
                  ).p(padding ?? 0),
          ).cornerRadius(radius),
        ],
      );
    }
  }
}
