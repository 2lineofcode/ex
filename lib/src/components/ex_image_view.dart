import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../ex.dart';

///   created               : Aditya Pratama
///   originalFilename      : ex_avatar_view
///   date                  : 21 Jun 2021
///   —————————————————————————————————————————————————————————————————————————————
///   screenshot            : https://prnt.sc/16i090f
class ExImageView extends StatelessWidget {
  const ExImageView({
    Key? key,
    required this.url,
    this.height,
    this.width,
    this.borderColor,
    this.borderWidth,
    this.radius = 8,
    this.boxFit = BoxFit.cover,
    this.isAllowPreview = false,
  }) : super(key: key);

  final String url;
  final double? height;
  final double? width;
  final Color? borderColor;
  final double? borderWidth;
  final double radius;
  final BoxFit boxFit;
  final bool? isAllowPreview;

  @override
  Widget build(BuildContext context) {
    final header = {'Referer': 'https://mobile.gredu.co/*'};

    if (isAllowPreview == true) {
      return ZStack(
        [
          Container(
            width: width ?? 70,
            height: height ?? 70,
            decoration: BoxDecoration(
              border: Border.all(color: borderColor ?? Colors.grey[300]!, width: borderWidth ?? 0.5),
            ),
            child: url.isUrl!
                ? Image.network(
                    url,
                    headers: header,
                    width: height ?? 70,
                    height: width ?? 70,
                    fit: BoxFit.cover,
                    isAntiAlias: true,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      }

                      if (Platform.isIOS) {
                        return CupertinoActivityIndicator();
                      } else {
                        return CircularProgressIndicator();
                      }
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return Container(color: Colors.grey[300], child: Icon(Icons.image));
                    },
                  )
                : Container(color: Colors.grey[300], child: Icon(Icons.image)),
          ).cornerRadius(radius),
        ],
      ).onTap(() {
        if (url.isUrl!) {
          ExImagePreview.show(context: context, arrayUrl: [url]);
        }
      });
    } else {
      return ZStack(
        [
          Container(
            width: width ?? 70,
            height: height ?? 70,
            decoration: BoxDecoration(
              border: Border.all(color: borderColor ?? Colors.grey[300]!, width: borderWidth ?? 0.5),
            ),
            child: url.isUrl!
                ? Image.network(
                    url,
                    headers: header,
                    width: height ?? 70,
                    height: width ?? 70,
                    fit: BoxFit.cover,
                    isAntiAlias: true,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      }

                      if (Platform.isIOS) {
                        return CupertinoActivityIndicator();
                      } else {
                        return CircularProgressIndicator();
                      }
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return Container(color: Colors.grey[300], child: Icon(Icons.image));
                    },
                  )
                : Container(color: Colors.grey[300], child: Icon(Icons.image)),
          ).cornerRadius(radius),
        ],
      );
    }
  }
}
