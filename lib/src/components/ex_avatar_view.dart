import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../ex.dart';
import '../extensions/index.dart';

///   created               : Aditya Pratama
///   originalFilename      : ex_avatar_view
///   date                  : 21 Jun 2021
///   —————————————————————————————————————————————————————————————————————————————
///   screenshot            : https://prnt.sc/16i090f
///
class ExAvatarView extends StatelessWidget {
  const ExAvatarView({
    Key? key,
    required this.url,
    required this.name,
    this.height,
    this.width,
    this.borderColor,
    this.borderWidth,
    this.textSize,
    this.textColor,
    this.bgColor,
    this.isAllowPreview = false,
  }) : super(key: key);

  final String url;
  final String? name;
  final double? height;
  final double? width;
  final Color? borderColor;
  final double? borderWidth;
  final double? textSize;
  final Color? textColor;
  final Color? bgColor;
  final bool? isAllowPreview;

  @override
  Widget build(BuildContext context) {
    final header = {'Referer': 'https://mobile.gredu.co/*'};
    if (isAllowPreview == true) {
      return ZStack(
        [
          Container(
            width: height ?? 70,
            height: width ?? 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: borderColor ?? Colors.black12, width: borderWidth ?? 2.0),
            ),
            child: ClipOval(
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
                        return Stack(
                          fit: StackFit.expand,
                          children: [
                            name.initialName.text.color(textColor ?? Colors.white).size(textSize ?? 14).makeCentered().backgroundColor(bgColor ?? _buildBgColorByName(name.initialName)),
                          ],
                        );
                      },
                    )
                  : Stack(
                      fit: StackFit.expand,
                      children: [
                        name.initialName.text.color(textColor ?? Colors.white).size(textSize ?? 14).makeCentered().backgroundColor(bgColor ?? _buildBgColorByName(name.initialName)),
                      ],
                    ),
            ),
          ),
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
            width: height ?? 70,
            height: width ?? 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: borderColor ?? Colors.black12, width: borderWidth ?? 2.0),
            ),
            child: ClipOval(
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
                        return Stack(
                          fit: StackFit.expand,
                          children: [
                            name.initialName.text.color(textColor ?? Colors.white).size(textSize ?? 14).makeCentered().backgroundColor(bgColor ?? _buildBgColorByName(name.initialName)),
                          ],
                        );
                      },
                    )
                  : Stack(
                      fit: StackFit.expand,
                      children: [
                        name.initialName.text.color(textColor ?? Colors.white).size(textSize ?? 14).makeCentered().backgroundColor(bgColor ?? _buildBgColorByName(name.initialName)),
                      ],
                    ),
            ),
          ),
        ],
      );
    }
  }

  // @todo : FIX ME, this ugly -_-
  Color _buildBgColorByName(String initialName) {
    Color output;
    switch (initialName.substring(0, 1)) {
      case 'A':
        output = const Color(0xff5876dc);
        break;
      case 'B':
        output = const Color(0xffa6daf1);
        break;
      case 'C':
        output = const Color(0xffb4aa52);
        break;
      case 'D':
        output = const Color(0xff936b5e);
        break;
      case 'E':
        output = const Color(0xff8246a7);
        break;
      case 'F':
        output = const Color(0xffa78346);
        break;
      case 'G':
        output = const Color(0xffa74646);
        break;
      case 'H':
        output = const Color(0xff46a780);
        break;
      case 'I':
        output = const Color(0xff4656a7);
        break;
      case 'J':
        output = const Color(0xffa446a7);
        break;
      case 'K':
        output = const Color(0xffa7468c);
        break;
      case 'L':
        output = const Color(0xff766873);
        break;
      case 'M':
        output = const Color(0xffabbfab);
        break;
      case 'O':
        output = const Color(0xff8471a3);
        break;
      case 'P':
        output = const Color(0xffa071a3);
        break;
      case 'Q':
        output = const Color(0xffa1a371);
        break;
      case 'R':
        output = const Color(0xff7176a3);
        break;
      case 'S':
        output = const Color(0xffa37171);
        break;
      case 'T':
        output = const Color(0xffa37198);
        break;
      case 'U':
        output = const Color(0xff8ea371);
        break;
      case 'V':
        output = const Color(0xff7193a3);
        break;
      case 'W':
        output = const Color(0xff7189a3);
        break;
      case 'X':
        output = const Color(0xffa071a3);
        break;
      case 'Y':
        output = const Color(0xffa37171);
        break;
      case 'Z':
        output = const Color(0xff7a71a3);
        break;
      default:
        output = Colors.primaries[Random().nextInt(Colors.primaries.length)];
        break;
    }
    return output;
  }
}
