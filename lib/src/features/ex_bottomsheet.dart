import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../ex.dart';

enum BSHeaderType { dash, close }

enum BSContentType { regular, radio }

mixin ExBottomSheet {
  // —————————————————————————————————————————————————————————————————————————
  // BOTTOM SHEET DIALOG  ————————————————————————————————————————————————————
  // —————————————————————————————————————————————————————————————————————————
  static void basic(
    BuildContext context, {
    required String? title,
    required Widget content,
    TextStyle? titleStyle,
    Color? backgroundColor,
    Color? barrierColor,
    bool? isDismissible,
    bool? isFullScreen,
    bool? persistent,
    double? radius,
    bool? showDivider = true,
    double? padding,
  }) {
    // add haptic feedback (UX)
    HapticFeedback.lightImpact();
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: VStack(
            [
              ExDashLine().pSymmetric(v: 24),
              if (title != null) ...[
                title.text.bold.black.size(18).maxLines(2).textStyle(titleStyle).ellipsis.make().pOnly(bottom: 8).pSymmetric(h: 24),
                if (showDivider == true) Divider().pOnly(bottom: 8) else 8.heightBox,
              ],
              content.pSymmetric(h: padding ?? 24),
            ],
          ),
        );
      },
      backgroundColor: backgroundColor ?? Colors.white,
      barrierColor: barrierColor,
      isDismissible: isDismissible ?? true,
      isScrollControlled: isFullScreen ?? false,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: backgroundColor ?? Colors.white),
        borderRadius: BorderRadius.only(topLeft: Radius.circular(radius ?? 24), topRight: Radius.circular(radius ?? 24)),
      ),
    );
  }

  static void dragable(
    BuildContext context, {
    required Widget content,
    double radius = 16,
    bool isClose = false,
    double initialChildSize = 0.7,
    bool isScrollControlled = true,
    double minChildSize = 0.5,
    Function()? onClose,
  }) {
    // add haptic feedback (UX)
    HapticFeedback.lightImpact();
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: initialChildSize,
          maxChildSize: 0.9,
          minChildSize: minChildSize,
          builder: (_, controller) => Container(
            decoration: ExDecorator.top(radius: radius),
            child: SafeArea(
              child: VStack(
                [
                  const ExDashLine(),
                  if (isClose)
                    const Align(
                      alignment: Alignment.centerRight,
                      child: Icon(
                        Icons.close_rounded,
                        size: 25,
                        color: Colors.black,
                      ),
                    ).onInkTap(
                      () => {
                        Navigator.pop(context),
                        if (onClose != null) onClose() else '',
                      },
                    )
                  else
                    const SizedBox(),
                  ListView(
                    controller: controller,
                    children: [content],
                  ).pSymmetric(v: 24).expand(),
                ],
              ).p24(),
            ),
          ),
        );
      },
      elevation: 10,
      isScrollControlled: isScrollControlled,
      isDismissible: true,
    );
  }

  static void list(
    BuildContext context, {
    required List<ExKeyValue> data,
    required String title,
    required String keySelected,
    required Function(String, String) callback,
    bool? isFullScreen,
    bool showDivider = false,
    Widget? onEmpty,
    double? radius = 16,
    bool showTrailing = false,
    TextStyle? titleStyle,
    Color? backgroundColor,
    Color? barrierColor,
    bool? isDismissible,
    bool? persistent,
    double? padding,
  }) {
    // add haptic feedback (UX)
    HapticFeedback.lightImpact();
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: VStack(
            [
              ExDashLine().pOnly(top: 24),
              title.text.bold.black.size(18).maxLines(2).ellipsis.make().pOnly(top: 24, bottom: 8).pSymmetric(h: 24),
              if (showDivider == true) Divider().pOnly(bottom: 8) else 8.heightBox,
              Expanded(
                child: data.isNotEmpty
                    ? ListView.separated(
                        separatorBuilder: (context, index) => Divider(),
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: data[index].icon,
                            title: data[index].key == keySelected ? data[index].value.text.bold.color(Theme.of(context).primaryColor).size(14).make() : data[index].value.text.size(14).make(),
                            trailing: showTrailing == true
                                ? data[index].key == keySelected
                                    ? Icon(Icons.radio_button_on)
                                    : Icon(Icons.radio_button_off)
                                : null,
                            onTap: () {
                              Navigator.pop(context);
                              callback(data[index].key, data[index].value);
                            },
                          );
                        },
                      ).pSymmetric(h: 24)
                    : onEmpty ?? 0.heightBox,
              ),
            ],
          ),
        );
      },
      backgroundColor: backgroundColor ?? Colors.white,
      barrierColor: barrierColor,
      isDismissible: isDismissible ?? true,
      isScrollControlled: isFullScreen ?? false,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: backgroundColor ?? Colors.white),
        borderRadius: BorderRadius.only(topLeft: Radius.circular(radius ?? 24), topRight: Radius.circular(radius ?? 24)),
      ),
    );
  }
}
