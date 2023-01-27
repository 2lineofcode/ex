import 'dart:typed_data';

import 'package:ex/src/color.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../../ex.dart';

class ExImageNoCacheView extends StatelessWidget {
  const ExImageNoCacheView({
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

  Future<Uint8List> getImageBytes() async {
    final response = await get(Uri.parse(url), headers: headers);
    return response.bodyBytes;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Uint8List>(
      future: getImageBytes(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Image.memory(
            snapshot.data!,
            errorBuilder: (context, error, stackTrace) {
              // disediain aja, HARUSNYA tidak akan pernah terjadi.
              return ExImageView(
                url: 'https://user-images.githubusercontent.com/36602270/174274220-ea090efe-7903-4ec5-a189-63b807fcf35d.jpg',
              );
            },
          ).backgroundColor(Colors.white);
        }
        return SizedBox(
          width: 24,
          height: 24,
          child: Container(color: colorNeutral),
        ).shimmer(primaryColor: colorNeutral[100]!, secondaryColor: colorNeutral[200]);
      },
    );
  }
}
