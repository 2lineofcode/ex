import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../ex.dart';

///  <img width="200" alt="image" src="https://user-images.githubusercontent.com/36602270/169626607-f16c4fca-dce0-4095-b09c-c5ce915b649e.png">
class ExImageView extends StatelessWidget {
  const ExImageView({
    required this.source,
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

  final String source;
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
    if (source.isEmptyOrNull) {
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

    if (source.isURL) {
      return ZStack(
        [
          SizedBox(
            width: size ?? width,
            height: size ?? height,
            child: source.contains('.svg')
                ? SvgPicture.network(
                    source,
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
                  ).p(padding ?? 0)
                : CachedNetworkImage(
                    imageUrl: source,
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,
                          fit: boxFit,
                        ),
                      ),
                    ),
                    width: size ?? width,
                    height: size ?? height,
                    httpHeaders: headers,
                    placeholder: (context, url) =>
                        Container(color: Vx.neutral500).shimmer(
                      primaryColor: Get.isDarkMode
                          ? Get.theme.primaryColor
                          : Vx.neutral100,
                      secondaryColor:
                          Get.isDarkMode ? Vx.neutral800 : Vx.neutral200,
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
            child: source.contains('.svg')
                ? SvgPicture.asset(
                    source,
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
                    source,
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
