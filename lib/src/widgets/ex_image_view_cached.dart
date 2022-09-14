import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../ex.dart';

///   created               : Aditya Pratama
///   originalFilename      : ex_avatar_view
///   date                  : 21 Jun 2021
///   —————————————————————————————————————————————————————————————————————————————
///  <img width="200" alt="image" src="https://user-images.githubusercontent.com/36602270/169626607-f16c4fca-dce0-4095-b09c-c5ce915b649e.png">

class ExImageViewCached extends StatelessWidget {
  const ExImageViewCached({
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
    this.errorIcon = Icons.image,
    this.canRemove = false,
    required this.onTap,
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
  final Function(String) onTap;
  final IconData? errorIcon;
  final bool? canRemove;

  @override
  Widget build(BuildContext context) {
    return ZStack(
      [
        Container(
          width: size ?? width,
          height: size ?? height,
          decoration: BoxDecoration(
            border: Border.all(color: borderColor ?? Colors.grey[300]!, width: borderWidth ?? 0.0),
          ),
          child: url.isUrl!
              ? CachedNetworkImage(
                  imageUrl: url,
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  width: size ?? width,
                  height: size ?? height,
                  httpHeaders: headers,
                  placeholder: (context, url) => LoadingAnimationWidget.discreteCircle(
                    color: Theme.of(context).primaryColor,
                    size: 24,
                  ).centered(),
                  errorWidget: (context, url, error) => Container(
                    color: Colors.grey[300],
                    child: Icon(errorIcon),
                  ),
                )
              : Container(color: Colors.grey[300], child: Icon(errorIcon)),
        ).cornerRadius(radius),
      ],
    ).onTap(() {
      if (url.isUrl!) {
        onTap.call(url);
      }
    });
  }
}
