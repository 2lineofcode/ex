// ignore_for_file: library_private_types_in_public_api, no_default_cases

import 'package:ex/ex.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExAccordion extends StatefulWidget {
  /// An accordion is used to show (and hide) content. Use [showAccordion] to hide & show the accordion content.
  const ExAccordion({
    super.key,
    this.title,
    this.content,
    this.titleChild,
    this.contentChild,
    this.collapsedTitleBackgroundColor,
    this.expandedTitleBackgroundColor,
    this.collapsedIcon = const Icon(Icons.keyboard_arrow_down_rounded),
    this.expandedIcon = const Icon(Icons.keyboard_arrow_up_rounded),
    this.textStyle = const TextStyle(fontSize: 16),
    this.titlePadding = const EdgeInsets.all(10),
    this.contentBackgroundColor,
    this.contentPadding = const EdgeInsets.all(10),
    this.titleBorder = const Border(),
    this.contentBorderColor,
    this.margin,
    this.showAccordion = false,
    this.onToggleCollapsed,
    this.titleBorderRadius = const BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)),
    this.contentBorderRadius = const BorderRadius.only(bottomLeft: Radius.circular(12), bottomRight: Radius.circular(12)),
  });

  /// controls if the accordion should be collapsed or not making it possible to be controlled from outside
  final bool showAccordion;

  /// child of  type [Widget]is alternative to title key. title will get priority over titleChild
  final Widget? titleChild;

  /// content of type[String] which shows the messages after the [ExAccordion] is expanded
  final Widget? content;

  /// contentChild of  type [Widget]is alternative to content key. content will get priority over contentChild
  final Widget? contentChild;

  /// type of [Color] or [GFColors] which is used to change the background color of the [ExAccordion] title when it is collapsed
  final Color? collapsedTitleBackgroundColor;

  /// type of [Color] or [GFColors] which is used to change the background color of the [ExAccordion] title when it is expanded
  final Color? expandedTitleBackgroundColor;

  /// collapsedIcon of type [Widget] which is used to show when the [ExAccordion] is collapsed
  final Widget collapsedIcon;

  /// expandedIcon of type[Widget] which is used when the [ExAccordion] is expanded
  final Widget expandedIcon;

  /// text of type [String] is alternative to child. text will get priority over titleChild
  final String? title;

  /// textStyle of type [textStyle] will be applicable to text only and not for the child
  final TextStyle textStyle;

  /// titlePadding of type [EdgeInsets] which is used to set the padding of the [ExAccordion] title
  final EdgeInsets titlePadding;

  /// descriptionPadding of type [EdgeInsets] which is used to set the padding of the [ExAccordion] description
  final EdgeInsets contentPadding;

  /// type of [Color] or [GFColors] which is used to change the background color of the [ExAccordion] description
  final Color? contentBackgroundColor;

  /// margin of type [EdgeInsets] which is used to set the margin of the [ExAccordion]
  final EdgeInsets? margin;

  /// titleBorderColor of type  [Color] or [GFColors] which is used to change the border color of title
  final Border titleBorder;

  /// contentBorderColor of type  [Color] or [GFColors] which is used to change the border color of content
  final Color? contentBorderColor;

  /// titleBorderRadius of type  [Radius]  which is used to change the border radius of title
  final BorderRadius titleBorderRadius;

  /// contentBorderRadius of type  [Radius]  which is used to change the border radius of content
  final BorderRadius contentBorderRadius;

  /// function called when the content body collapsed
  final Function(bool)? onToggleCollapsed;

  @override
  _ExAccordionState createState() => _ExAccordionState();
}

class _ExAccordionState extends State<ExAccordion> with TickerProviderStateMixin {
  late AnimationController animationController;
  late AnimationController controller;
  late Animation<Offset> offset;
  late bool showAccordion;

  @override
  void initState() {
    showAccordion = widget.showAccordion;
    animationController = AnimationController(duration: const Duration(seconds: 2), vsync: this);
    controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    offset = Tween(
      begin: const Offset(0, -0.06),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.fastOutSlowIn,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Container(
        margin: widget.margin ?? const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: _toggleCollapsed,
              borderRadius: widget.titleBorderRadius,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: widget.titleBorderRadius,
                  border: widget.titleBorder,
                  color: Get.isDarkMode
                      ? showAccordion
                          //
                          ? widget.expandedTitleBackgroundColor ?? Vx.neutral500
                          : widget.collapsedTitleBackgroundColor ?? Vx.neutral500
                      : showAccordion
                          //
                          ? widget.expandedTitleBackgroundColor ?? Vx.neutral200
                          : widget.collapsedTitleBackgroundColor ?? Vx.neutral200,
                ),
                padding: widget.titlePadding,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: widget.title != null ? Text(widget.title!, style: widget.textStyle) : (widget.titleChild ?? Container()),
                    ),
                    if (showAccordion) widget.expandedIcon else widget.collapsedIcon,
                  ],
                ),
              ),
            ),
            if (showAccordion)
              Container(
                decoration: BoxDecoration(
                  borderRadius: widget.contentBorderRadius,
                  border: Get.isDarkMode
                      ? Border.all(
                          color: widget.contentBorderColor ?? Vx.neutral500,
                        )
                      : Border.all(
                          color: widget.contentBorderColor ?? Vx.neutral200,
                        ),
                  color: widget.contentBackgroundColor,
                ),
                width: MediaQuery.of(context).size.width,
                padding: widget.contentPadding,
                child: SlideTransition(
                  position: offset,
                  child: widget.content != null ? widget.content! : (widget.contentChild ?? Container()),
                ),
              )
            else
              Container(),
          ],
        ),
      );

  void _toggleCollapsed() {
    setState(() {
      switch (controller.status) {
        case AnimationStatus.completed:
          controller.forward(from: 0);
          break;
        case AnimationStatus.dismissed:
          controller.forward();
          break;
        default:
      }
      showAccordion = !showAccordion;
      if (widget.onToggleCollapsed != null) {
        widget.onToggleCollapsed?.call(showAccordion);
      }
    });
  }
}
