// ignore_for_file: use_is_even_rather_than_modulo, unnecessary_null_checks

import 'package:flutter/material.dart';

import '../../ex.dart';
import '../color.dart';

class ExActivityTimeLine extends StatelessWidget {
  const ExActivityTimeLine({
    Key? key,
    this.timelineName = '-',
    this.timelineAgo = '-',
    this.showMoreMenu = true,
    this.content,
    this.index,
    this.onMoreMenuClick,
    this.timelineIcon,
  }) : super(key: key);

  final String? index;
  final String? timelineName;
  final String? timelineAgo;
  final bool? showMoreMenu;
  final Widget? content;
  final Function(String)? onMoreMenuClick;
  final Widget? timelineIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// widget start
        HStack(
          [
            /// left (timeline)
            ZStack(
              [
                DottedLine(
                  direction: Axis.vertical,
                  lineLength: 250,
                  dashColor: colorNeutral[200]!,
                  lineThickness: 1.4,
                ).pOnly(left: 12),

                /// timelineIcon
                if (timelineIcon != null)
                  timelineIcon!
                else
                  Icon(
                    Icons.linked_camera_outlined,
                    size: 16,
                  ).p(5).backgroundColor(Colors.blue[100]!).cornerRadius(90),
              ],
            ).pOnly(right: 12),

            /// content header
            VStack(
              [
                /// timelineName
                HStack(
                  [
                    '$timelineName'.text.bold.black.ellipsis.maxLines(1).make().pOnly(right: 8).expand(),

                    /// more menu
                    if (showMoreMenu == true)
                      Icon(
                        Icons.more_horiz,
                        color: colorNeutral[300],
                      ).onInkTap(() => onMoreMenuClick?.call(index!))
                  ],
                ),

                /// timelineago
                '$timelineAgo'.text.caption(context).make().pOnly(bottom: 16),

                Container(
                  width: double.infinity,
                  decoration: ExDecorator.box(),
                  child:

                      // main content
                      content ??
                          VStack(
                            [
                              'sample data'.text.caption(context).black.make(),
                              ExImageView(
                                url: 'https://picsum.photos/200/300',
                                height: 120,
                                width: double.infinity,
                              ).pSymmetric(v: 12),
                            ],
                          ).p12(),
                )
              ],
            ).expand(),
          ],
          crossAlignment: CrossAxisAlignment.start,
        ),
      ],
    );
  }
}

class DottedLine extends StatelessWidget {
  /// Creates dotted line with the given parameters
  const DottedLine({
    Key? key,
    this.direction = Axis.horizontal,
    this.lineLength = double.infinity,
    this.lineThickness = 1.0,
    this.dashLength = 4.0,
    this.dashColor = Colors.black,
    this.dashGradient,
    this.dashGapLength = 4.0,
    this.dashGapColor = Colors.transparent,
    this.dashGapGradient,
    this.dashRadius = 0.0,
    this.dashGapRadius = 0.0,
  })  : assert(
            dashGradient == null || dashGradient.length == 2,
            'The dashGradient must have only two colors.\n'
            'The beginning color and the ending color of the gradient.'),
        assert(
            dashGapGradient == null || dashGapGradient.length == 2,
            'The dashGapGradient must have only two colors.\n'
            'The beginning color and the ending color of the gradient.'),
        super(key: key);

  /// The direction of the entire dotted line. Default [Axis.horizontal].
  final Axis direction;

  /// The length of the entire dotted line. Default [double.infinity].
  final double lineLength;

  /// The thickness of the entire dotted line. Default (1.0).
  final double lineThickness;

  /// The length of the dash. Default (4.0).
  final double dashLength;

  /// The color of the dash. Default [Colors.black].
  ///
  /// This is ignored if [dashGradient] is non-null.
  final Color dashColor;

  /// The gradient colors of the dash. Default null.
  /// The first color is beginning color, the second one is ending color.
  ///
  /// If this is specified, [dashColor] has no effect.
  final List<Color>? dashGradient;

  /// The radius of the dash. Default (0.0).
  final double dashRadius;

  /// The length of the dash gap. Default (4.0).
  final double dashGapLength;

  /// The color of the dash gap. Default [Colors.transparent].
  ///
  /// This is ignored if [dashGapGradient] is non-null.
  final Color dashGapColor;

  /// The gradient colors of the dash gap. Default null.
  /// The first color is beginning color, the second one is ending color.
  ///
  /// If this is specified, [dashGapColor] has no effect.
  final List<Color>? dashGapGradient;

  /// The radius of the dash gap. Default (0.0).
  final double dashGapRadius;

  @override
  Widget build(BuildContext context) {
    final isHorizontal = direction == Axis.horizontal;

    return SizedBox(
      width: isHorizontal ? lineLength : lineThickness,
      height: isHorizontal ? lineThickness : lineLength,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final lineLength = _getLineLength(constraints, isHorizontal);
          final dashAndDashGapCount = _calculateDashAndDashGapCount(lineLength);
          final dashCount = dashAndDashGapCount[0];
          final dashGapCount = dashAndDashGapCount[1];

          return Wrap(
            direction: direction,
            children: List.generate(dashCount + dashGapCount, (index) {
              if (index % 2 == 0) {
                final dashColor = _getDashColor(dashCount, index ~/ 2);
                final dash = _buildDash(isHorizontal, dashColor);
                return dash;
              } else {
                final dashGapColor = _getDashGapColor(dashGapCount, index ~/ 2);
                final dashGap = _buildDashGap(isHorizontal, dashGapColor);
                return dashGap;
              }
            }).toList(growable: false),
          );
        },
      ),
    );
  }

  /// If [lineLength] is [double.infinity],
  /// get the maximum value of the parent widget.
  /// And if the value is specified, use the specified value.
  double _getLineLength(BoxConstraints constraints, bool isHorizontal) {
    return lineLength == double.infinity
        ? isHorizontal
            ? constraints.maxWidth
            : constraints.maxHeight
        : lineLength;
  }

  /// Calculate the count of (dash + dashGap).
  ///
  /// example1) [lineLength] is 10, [dashLength] is 1, [dashGapLength] is 1.
  /// "- - - - - "
  /// example2) [lineLength] is 10, [dashLength] is 1, [dashGapLength] is 2.
  /// "-  -  -  -"
  List<int> _calculateDashAndDashGapCount(double lineLength) {
    final dashAndDashGapLength = dashLength + dashGapLength;
    var dashCount = lineLength ~/ dashAndDashGapLength;
    final dashGapCount = lineLength ~/ dashAndDashGapLength;
    if (dashLength <= lineLength % dashAndDashGapLength) {
      dashCount += 1;
    }
    return [dashCount, dashGapCount];
  }

  Widget _buildDash(bool isHorizontal, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(dashRadius),
      ),
      width: isHorizontal ? dashLength : lineThickness,
      height: isHorizontal ? lineThickness : dashLength,
    );
  }

  Color _getDashColor(int maxDashCount, int index) {
    return dashGradient == null
        ? dashColor
        : _calculateGradientColor(
            dashGradient![0],
            dashGradient![1],
            maxDashCount,
            index,
          );
  }

  Widget _buildDashGap(bool isHorizontal, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(dashGapRadius),
      ),
      width: isHorizontal ? dashGapLength : lineThickness,
      height: isHorizontal ? lineThickness : dashGapLength,
    );
  }

  Color _getDashGapColor(int maxDashGapCount, int index) {
    return dashGapGradient == null
        ? dashGapColor
        : _calculateGradientColor(
            dashGapGradient![0],
            dashGapGradient![1],
            maxDashGapCount,
            index,
          );
  }

  Color _calculateGradientColor(
    Color startColor,
    Color endColor,
    int maxItemCount,
    int index,
  ) {
    final diffAlpha = endColor.alpha - startColor.alpha;
    final diffRed = endColor.red - startColor.red;
    final diffGreen = endColor.green - startColor.green;
    final diffBlue = endColor.blue - startColor.blue;

    final amountOfChangeInAlphaPerItem = diffAlpha ~/ maxItemCount;
    final amountOfChangeInRedPerItem = diffRed ~/ maxItemCount;
    final amountOfChangeInGreenPerItem = diffGreen ~/ maxItemCount;
    final amountOfChangeInBluePerItem = diffBlue ~/ maxItemCount;

    return startColor
        .withAlpha(startColor.alpha + amountOfChangeInAlphaPerItem * index)
        .withRed(startColor.red + amountOfChangeInRedPerItem * index)
        .withGreen(startColor.green + amountOfChangeInGreenPerItem * index)
        .withBlue(startColor.blue + amountOfChangeInBluePerItem * index);
  }
}
