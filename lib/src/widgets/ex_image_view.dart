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
      return Container(
        decoration: ExDecorator.box(
          fillColor: Vx.neutral300,
          borderColor: Vx.neutral300,
        ),
        width: size ?? width,
        height: size ?? height,
        child: Icon(Icons.broken_image_rounded, color: Vx.neutral500, size: 16),
      );
    }

    if (url.isURL) {
      return ZStack(
        [
          SizedBox(
            width: size ?? width,
            height: size ?? height,
            child: CachedNetworkImage(
              imageUrl: url,
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  image: DecorationImage(image: imageProvider, fit: boxFit),
                ),
              ),
              width: size ?? width,
              height: size ?? height,
              httpHeaders: headers,
              placeholder: (context, url) =>
                  Container(color: Vx.neutral500).shimmer(
                primaryColor:
                    Get.isDarkMode ? Get.theme.primaryColor : Vx.neutral100,
                secondaryColor: Get.isDarkMode ? Vx.neutral800 : Vx.neutral200,
              ),
              errorWidget: (context, url, error) => Container(
                color: Colors.grey[300],
                child: errorWidget ??
                    Icon(
                      Icons.broken_image_rounded,
                      color: Vx.neutral500,
                      size: 18,
                    ),
              ),
            ).p(padding ?? 0),
          ).cornerRadius(radius),
        ],
      );
    }

    /// assets
    else {
      return ZStack(
        [
          SizedBox(
            width: size ?? width,
            height: size ?? height,
            child: url.contains('.svg')
                ? SvgPicture.asset(
                    url,
                    width: size ?? width,
                    height: size ?? height,
                    fit: boxFit,
                    placeholderBuilder: (context) =>
                        Container(color: Vx.neutral500).shimmer(
                      primaryColor: Get.isDarkMode
                          ? Get.theme.primaryColor
                          : Vx.neutral100,
                      secondaryColor:
                          Get.isDarkMode ? Vx.neutral800 : Vx.neutral200,
                    ),
                    package: package,
                  ).p(padding ?? 0)
                : Image.asset(
                    url,
                    width: size ?? width,
                    height: size ?? height,
                    fit: boxFit,
                    isAntiAlias: true,
                    errorBuilder: (context, error, stackTrace) =>
                        Container(color: Colors.grey[300], child: errorWidget),
                    package: package,
                  ).p(padding ?? 0),
          ).cornerRadius(radius),
        ],
      );
    }
  }
}
