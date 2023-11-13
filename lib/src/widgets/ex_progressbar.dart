import 'dart:math' as math;

import 'package:flutter/material.dart';

class ExProgressBar extends StatelessWidget {
  const ExProgressBar({
    super.key,
    this.color,
    this.size,
    this.secondRingColor,
    this.thirdRingColor,
  });

  final Color? color;
  final double? size;
  final Color? secondRingColor;
  final Color? thirdRingColor;

  @override
  Widget build(BuildContext context) {
    return DiscreteCircle(
      color: color ?? Theme.of(context).hintColor,
      size: size ?? 24,
      secondCircleColor: secondRingColor ?? Colors.teal,
      thirdCircleColor: thirdRingColor ?? Colors.orange,
      key: key,
    );
  }
}

class LoadingAnimationWidget {
  LoadingAnimationWidget._();

  static Widget discreteCircle({
    required Color color,
    required double size,
    Color secondRingColor = Colors.teal,
    Color thirdRingColor = Colors.orange,
    Key? key,
  }) {
    return DiscreteCircle(
      color: color,
      size: size,
      secondCircleColor: secondRingColor,
      thirdCircleColor: thirdRingColor,
      key: key,
    );
  }
}

// —————————————————————————————————————————————————————————————————————————————
// DiscreteCircle
// —————————————————————————————————————————————————————————————————————————————
class DiscreteCircle extends StatefulWidget {
  const DiscreteCircle({
    required this.color,
    required this.size,
    required this.secondCircleColor,
    required this.thirdCircleColor,
    super.key,
  });

  final double size;
  final Color color;
  final Color secondCircleColor;
  final Color thirdCircleColor;

  @override
  State<DiscreteCircle> createState() => _DiscreteCircleState();
}

class _DiscreteCircleState extends State<DiscreteCircle> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    final color = widget.color;
    final size = widget.size;
    final strokeWidth = size / 8;
    final secondRingColor = widget.secondCircleColor;
    final thirdRingColor = widget.thirdCircleColor;
    return AnimatedBuilder(
      animation: _animationController,
      builder: (_, __) {
        return Stack(
          children: [
            Transform.rotate(
              angle: Tween<double>(begin: 0, end: 2 * math.pi)
                  .animate(
                    CurvedAnimation(
                      parent: _animationController,
                      curve: Interval(0.68, 0.95, curve: Curves.easeOut),
                    ),
                  )
                  .value,
              child: Visibility(
                visible: _animationController.value >= 0.5,
                child: Arc.draw(
                  color: thirdRingColor,
                  size: size,
                  strokeWidth: strokeWidth,
                  startAngle: -math.pi / 2,
                  endAngle: Tween<double>(
                    begin: math.pi / 2,
                    end: math.pi / (size * size),
                  )
                      .animate(
                        CurvedAnimation(
                          parent: _animationController,
                          curve: const Interval(0.7, 0.95, curve: Curves.easeOutSine),
                        ),
                      )
                      .value,
                ),
              ),
            ),
            Visibility(
              visible: _animationController.value >= 0.5,
              child: Arc.draw(
                color: secondRingColor,
                size: size,
                strokeWidth: strokeWidth,
                startAngle: -math.pi / 2,
                endAngle: Tween<double>(
                  begin: -2 * math.pi,
                  end: math.pi / (size * size),
                )
                    .animate(
                      CurvedAnimation(
                        parent: _animationController,
                        curve: const Interval(
                          0.6,
                          0.95,
                          // curve: Curves.easeIn,
                          curve: Curves.easeOutSine,
                        ),
                      ),
                    )
                    .value,
              ),
            ),
            Visibility(
              visible: _animationController.value <= 0.5,
              // visible: true,
              child: Transform.rotate(
                angle: Tween<double>(begin: 0, end: math.pi * 0.06)
                    .animate(
                      CurvedAnimation(
                        parent: _animationController,
                        curve: const Interval(
                          0.48,
                          0.5,
                        ),
                      ),
                    )
                    .value,
                child: Arc.draw(
                  color: color,
                  size: size,
                  strokeWidth: strokeWidth,
                  startAngle: -math.pi / 2,
                  // endAngle: 1.94 * math.pi,
                  endAngle: Tween<double>(
                    begin: math.pi / (size * size),
                    end: 1.94 * math.pi,
                  )
                      .animate(
                        CurvedAnimation(
                          parent: _animationController,
                          curve: const Interval(
                            0.05,
                            0.48,
                            curve: Curves.easeOutSine,
                          ),
                        ),
                      )
                      .value,
                ),
              ),
            ),
            Visibility(
              visible: _animationController.value >= 0.5,
              child: Arc.draw(
                color: color,
                size: size,
                strokeWidth: strokeWidth,
                startAngle: -math.pi / 2,
                // endAngle: -1.94 * math.pi
                endAngle: Tween<double>(
                  // begin: -2 * math.pi,
                  begin: -1.94 * math.pi,
                  end: math.pi / (size * size),
                )
                    .animate(
                      CurvedAnimation(
                        parent: _animationController,
                        curve: const Interval(
                          0.5,
                          0.95,
                          curve: Curves.easeOutSine,
                        ),
                      ),
                    )
                    .value,
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

// —————————————————————————————————————————————————————————————————————————————
// Arc
// —————————————————————————————————————————————————————————————————————————————

class Arc extends CustomPainter {
  Arc._(
    this._color,
    this._strokeWidth,
    this._startAngle,
    this._sweepAngle,
  );

  final Color _color;
  final double _strokeWidth;
  final double _sweepAngle;
  final double _startAngle;

  static Widget draw({
    required Color color,
    required double size,
    required double strokeWidth,
    required double startAngle,
    required double endAngle,
  }) =>
      SizedBox(
        width: size,
        height: size,
        child: CustomPaint(
          painter: Arc._(
            color,
            strokeWidth,
            startAngle,
            endAngle,
          ),
        ),
      );

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 2),
      radius: size.height / 2,
    );

    const useCenter = false;
    final paint = Paint()
      ..color = _color
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = _strokeWidth;

    canvas.drawArc(rect, _startAngle, _sweepAngle, useCenter, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
