// ignore_for_file: type_annotate_public_apis, always_declare_return_types, use_late_for_private_fields_and_variables, library_private_types_in_public_api

import 'dart:convert';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';

import '../../ex.dart';

const _kRouteDuration = Duration(milliseconds: 1);

mixin ExImagePreview {
  static void showUrl(
    String url, {
    Object? tag,
    Map<String, String>? header,
    Color? backgroundColor,
  }) {
    Navigator.push(
      Get.context!,
      PageRouteBuilder(
        opaque: false,
        barrierColor: Colors.white.withOpacity(0),
        pageBuilder: (BuildContext context, _, __) {
          return FullScreenViewer(
            tag: tag ?? UniqueKey(),
            backgroundColor: backgroundColor ?? Colors.black,
            disableSwipeToDismiss: false,
            child: Image(
              image: Image.network(url, headers: header).image,
            ),
          );
        },
      ),
    );
  }

  static void showBase64(String base64, {Map<String, String>? header}) {
    showGeneralDialog(
      context: Get.context!,
      barrierColor: Colors.black.withOpacity(0.8),
      barrierDismissible: true,
      barrierLabel: 'Dialog',
      transitionDuration: Duration(milliseconds: 300),
      pageBuilder: (context, __, ___) {
        return Scaffold(
          backgroundColor: Colors.black.withOpacity(0.2),
          body: SafeArea(
            child: Stack(
              children: [
                PhotoView(
                  backgroundDecoration:
                      BoxDecoration(color: Colors.transparent),
                  imageProvider: Image.memory(base64Decode(base64)).image,
                ),
                HStack(
                  [
                    Spacer(),
                    CloseButton(color: Colors.white).p8(),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

enum DisposeLevel { high, medium, low }

class FullScreenViewer extends StatefulWidget {
  const FullScreenViewer({
    required this.child,
    required this.tag,
    required this.disableSwipeToDismiss,
    super.key,
    this.backgroundColor = Colors.black,
    this.backgroundIsTransparent = true,
    this.disposeLevel = DisposeLevel.medium,
  });

  final Widget child;
  final Color backgroundColor;
  final bool backgroundIsTransparent;
  final DisposeLevel? disposeLevel;
  final Object tag;
  final bool disableSwipeToDismiss;

  @override
  _FullScreenViewerState createState() => _FullScreenViewerState();
}

class _FullScreenViewerState extends State<FullScreenViewer> {
  double? _initialPositionY = 0;

  double? _currentPositionY = 0;

  double _positionYDelta = 0;

  double _opacity = 1;

  double _disposeLimit = 150;

  Duration _animationDuration = Duration.zero;

  @override
  void initState() {
    super.initState();
    setDisposeLevel();
  }

  setDisposeLevel() {
    if (widget.disposeLevel == DisposeLevel.high) {
      _disposeLimit = 300;
    } else if (widget.disposeLevel == DisposeLevel.medium) {
      _disposeLimit = 200;
    } else {
      _disposeLimit = 100;
    }
  }

  void _dragUpdate(DragUpdateDetails details) {
    setState(() {
      _currentPositionY = details.globalPosition.dy;
      _positionYDelta = _currentPositionY! - _initialPositionY!;
      setOpacity();
    });
  }

  void _dragStart(DragStartDetails details) {
    setState(() {
      _initialPositionY = details.globalPosition.dy;
    });
  }

  _dragEnd(DragEndDetails details) {
    if (_positionYDelta > _disposeLimit || _positionYDelta < -_disposeLimit) {
      Navigator.of(context).pop();
    } else {
      setState(() {
        _animationDuration = _kRouteDuration;
        _opacity = 1;
        _positionYDelta = 0;
      });

      Future.delayed(_animationDuration).then((_) {
        setState(() {
          _animationDuration = Duration.zero;
        });
      });
    }
  }

  setOpacity() {
    final tmp = _positionYDelta < 0
        ? 1 - ((_positionYDelta / 1000) * -1)
        : 1 - (_positionYDelta / 1000);
    if (kDebugMode) {
      print(tmp);
    }

    if (tmp > 1) {
      _opacity = 1;
    } else if (tmp < 0) {
      _opacity = 0;
    } else {
      _opacity = tmp;
    }

    if (_positionYDelta > _disposeLimit || _positionYDelta < -_disposeLimit) {
      _opacity = 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    final horizontalPosition = 0 + max(_positionYDelta, -_positionYDelta) / 15;
    return Hero(
      tag: widget.tag,
      child: Scaffold(
        backgroundColor: widget.backgroundIsTransparent
            ? Colors.transparent
            : widget.backgroundColor,
        body: Container(
          color: widget.backgroundColor.withOpacity(_opacity),
          constraints: BoxConstraints.expand(
            height: MediaQuery.of(context).size.height,
          ),
          child: Stack(
            children: <Widget>[
              AnimatedPositioned(
                duration: _animationDuration,
                curve: Curves.fastOutSlowIn,
                top: 0 + _positionYDelta,
                bottom: 0 - _positionYDelta,
                left: horizontalPosition,
                right: horizontalPosition,
                child: InteractiveViewer(
                  boundaryMargin: const EdgeInsets.all(double.infinity),
                  panEnabled: false,
                  child: widget.disableSwipeToDismiss
                      ? ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(40),
                          ),
                          clipBehavior: Clip.hardEdge,
                          child: widget.child,
                        )
                      : KeymotionGestureDetector(
                          onStart: _dragStart,
                          onUpdate: _dragUpdate,
                          onEnd: _dragEnd,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(40),
                            ),
                            clipBehavior: Clip.hardEdge,
                            child: widget.child,
                          ),
                        ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 60, 30, 0),
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(40),
                        ),
                        color: Color(0xff222222),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.clear,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class KeymotionGestureDetector extends StatelessWidget {
  /// @macro
  const KeymotionGestureDetector({
    required this.child,
    super.key,
    this.onUpdate,
    this.onEnd,
    this.onStart,
  });

  final Widget child;
  final GestureDragUpdateCallback? onUpdate;
  final GestureDragEndCallback? onEnd;
  final GestureDragStartCallback? onStart;

  @override
  Widget build(BuildContext context) {
    return RawGestureDetector(
      gestures: <Type, GestureRecognizerFactory>{
        VerticalDragGestureRecognizer:
            GestureRecognizerFactoryWithHandlers<VerticalDragGestureRecognizer>(
          () => VerticalDragGestureRecognizer()
            ..onStart = onStart
            ..onUpdate = onUpdate
            ..onEnd = onEnd,
          (instance) {},
        ),
        // DoubleTapGestureRecognizer: GestureRecognizerFactoryWithHandlers<DoubleTapGestureRecognizer>(
        //   () => DoubleTapGestureRecognizer()..onDoubleTap = onDoubleTap,
        //   (instance) {},
        // )
      },
      child: child,
    );
  }
}
