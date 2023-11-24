import 'dart:ui' show lerpDouble;

import 'package:flutter/material.dart';

import '../../ex.dart';

enum ExButtonState { busy, idle }

enum ExButtonType { elevated, outlined, text }

class ExButtonLoading extends StatefulWidget {
  const ExButtonLoading({
    required this.height,
    required this.width,
    required this.child,
    super.key,
    this.minWidth = 0,
    this.loader,
    this.animationDuration = const Duration(milliseconds: 450),
    this.curve = Curves.easeInOutCirc,
    this.reverseCurve = Curves.easeInOutCirc,
    this.onTap,
    this.color,
    this.borderColor,
    this.elevation,
    this.padding = EdgeInsets.zero,
    this.borderRadius = 90,
    this.clipBehavior = Clip.none,
    this.focusNode,
    this.materialTapTargetSize,
    this.roundLoadingShape = true,
    this.borderSide = const BorderSide(color: Colors.transparent, width: 0),
    this.disabledElevation,
    this.disabledColor,
    this.disabledTextColor,
    this.animate = false,
    this.type = ExButtonType.elevated,
  });
  final double height;
  final double width;
  final double minWidth;
  final Widget? loader;
  final Duration animationDuration;
  final Curve curve;
  final Curve reverseCurve;
  final Widget child;
  final Function(
    Function startLoading,
    Function stopLoading,
    ExButtonState btnState,
  )? onTap;
  final Color? color;
  final Color? borderColor;
  final double? elevation;
  final EdgeInsetsGeometry padding;
  final Clip clipBehavior;
  final FocusNode? focusNode;
  final MaterialTapTargetSize? materialTapTargetSize;
  final bool roundLoadingShape;
  final double borderRadius;
  final BorderSide borderSide;
  final double? disabledElevation;
  final Color? disabledColor;
  final Color? disabledTextColor;
  final bool animate;
  final ExButtonType type;

  @override
  State<ExButtonLoading> createState() => _LoadingBtnState();
}

class _LoadingBtnState extends State<ExButtonLoading>
    with TickerProviderStateMixin {
  double? loaderWidth;
  late Animation<double> _animation;
  late AnimationController _controller;
  ExButtonState btn = ExButtonState.idle;

  final GlobalKey _buttonKey = GlobalKey();
  double _minWidth = 0;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: widget.animationDuration);
    _animation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: widget.curve,
        reverseCurve: widget.reverseCurve,
      ),
    );
    _animation.addStatusListener((status) {
      if (status == AnimationStatus.dismissed) {
        setState(() {
          btn = ExButtonState.idle;
        });
      }
    });
    _minWidth = widget.height;
    loaderWidth = widget.height;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void animateForward() {
    setState(() {
      btn = ExButtonState.busy;
    });
    _controller.forward();
  }

  void animateReverse() {
    _controller.reverse();
  }

  double lerpWidth(double a, double b, double t) {
    if (a == 0.0 || b == 0.0) {
      return 0.0;
    } else {
      return a + (b - a) * t;
    }
  }

  double get minWidth => _minWidth;

  set minWidth(double w) {
    if (widget.minWidth == 0) {
      _minWidth = w;
    } else {
      _minWidth = widget.minWidth;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        switch (widget.type) {
          case ExButtonType.elevated:
            return _buttonBodyElevated();
          case ExButtonType.outlined:
            return _buttonBodyOutlined();
          case ExButtonType.text:
            return _buttonBodyText();
        }
      },
    );
  }

  Widget _buttonBodyElevated() {
    return SizedBox(
      height: widget.height,
      width: widget.animate
          ? lerpWidth(widget.width, minWidth, _animation.value)
          : widget.width,
      child: ElevatedButton(
        key: _buttonKey,
        style: ButtonStyle(
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              side: widget.borderSide,
              borderRadius: BorderRadius.circular(
                widget.roundLoadingShape
                    ? lerpDouble(
                        widget.borderRadius,
                        widget.height / 2,
                        _animation.value,
                      )!
                    : widget.borderRadius,
              ),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(widget.color),
          elevation: MaterialStateProperty.all<double?>(widget.elevation),
          padding:
              MaterialStateProperty.all<EdgeInsetsGeometry>(widget.padding),
        ),
        clipBehavior: widget.clipBehavior,
        focusNode: widget.focusNode,
        onPressed: () {
          widget.onTap!(animateForward, animateReverse, btn);
        },
        child: btn == ExButtonState.idle
            ? widget.child
            : widget.loader ??
                Container(
                  padding: EdgeInsets.all(10),
                  width: 40,
                  height: 40,
                  child: ExProgressBar(
                    color: Theme.of(context).hintColor,
                    size: 32,
                  ).centered(),
                ),
      ),
    );
  }

  Widget _buttonBodyOutlined() {
    return SizedBox(
      height: widget.height,
      width: widget.animate
          ? lerpWidth(widget.width, minWidth, _animation.value)
          : widget.width,
      child: OutlinedButton(
        key: _buttonKey,
        style: OutlinedButton.styleFrom(
          backgroundColor: widget.color,
          side: BorderSide(color: widget.borderColor ?? Vx.neutral300),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              widget.roundLoadingShape
                  ? lerpDouble(
                      widget.borderRadius,
                      widget.height / 2,
                      _animation.value,
                    )!
                  : widget.borderRadius,
            ),
          ),
          minimumSize: Size(widget.width, widget.height),
          foregroundColor: widget.color,
          elevation: widget.elevation,
          padding: widget.padding,
        ),
        clipBehavior: widget.clipBehavior,
        focusNode: widget.focusNode,
        onPressed: () {
          widget.onTap!(animateForward, animateReverse, btn);
        },
        child: btn == ExButtonState.idle
            ? widget.child
            : widget.loader ??
                Container(
                  padding: EdgeInsets.all(10),
                  width: 40,
                  height: 40,
                  child: ExProgressBar(
                    color: Theme.of(context).hintColor,
                    size: 32,
                  ).centered(),
                ),
      ),
    );
  }

  Widget _buttonBodyText() {
    return SizedBox(
      height: widget.height,
      width: widget.animate
          ? lerpWidth(widget.width, minWidth, _animation.value)
          : widget.width,
      child: TextButton(
        key: _buttonKey,
        style: ButtonStyle(
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              side: widget.borderSide,
              borderRadius: BorderRadius.circular(
                widget.roundLoadingShape
                    ? lerpDouble(
                        widget.borderRadius,
                        widget.height / 2,
                        _animation.value,
                      )!
                    : widget.borderRadius,
              ),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(widget.color),
          elevation: MaterialStateProperty.all<double?>(widget.elevation),
          padding:
              MaterialStateProperty.all<EdgeInsetsGeometry>(widget.padding),
        ),
        clipBehavior: widget.clipBehavior,
        focusNode: widget.focusNode,
        onPressed: () {
          widget.onTap!(animateForward, animateReverse, btn);
        },
        child: btn == ExButtonState.idle
            ? widget.child
            : widget.loader ??
                Container(
                  padding: EdgeInsets.all(10),
                  width: 40,
                  height: 40,
                  child: ExProgressBar(
                    color: Theme.of(context).hintColor,
                    size: 32,
                  ).centered(),
                ),
      ),
    );
  }
}
