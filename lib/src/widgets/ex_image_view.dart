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
    this.errorIcon = Icons.image,
    this.canRemove = false,
    this.onTap,
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
  final Function? onTap;
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
            border: Border.all(
              color: borderColor ?? Colors.grey[300]!,
              width: borderWidth ?? 0.5,
            ),
          ),
          child: url.isUrl!
              ? Image.network(
                  '$url?${DateTime.now().millisecondsSinceEpoch.toString()}',
                  headers: headers,
                  width: size ?? width,
                  height: size ?? height,
                  fit: BoxFit.cover,
                  isAntiAlias: true,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    }
                    return LoadingAnimationWidget.discreteCircle(
                      color: Theme.of(context).primaryColor,
                      size: 24,
                    ).centered();
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey[300],
                      child: Icon(errorIcon),
                    );
                  },
                )
              : Container(color: Colors.grey[300], child: Icon(errorIcon)),
        ).cornerRadius(radius),
      ],
    );
  }
}
