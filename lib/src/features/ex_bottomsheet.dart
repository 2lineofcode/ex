import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../ex.dart';

enum BSHeaderType { dash, close }

enum BSContentType { regular, radio }

mixin ExBottomSheet {
  // —————————————————————————————————————————————————————————————————————————
  // BOTTOM SHEET DIALOG  ————————————————————————————————————————————————————
  // —————————————————————————————————————————————————————————————————————————
  static void basic({
    required String? title,
    required Widget content,
    TextStyle? titleStyle,
    Color? backgroundColor,
    Color? barrierColor,
    bool? isDismissible,
    bool? isScrolled,
    bool? persistent,
    double? radius,
    bool? showDivider = true,
    bool? showDragIndicator = true,
    double? padding,
  }) {
    // add haptic feedback (UX)
    HapticFeedback.lightImpact();
    Get.bottomSheet(
      SafeArea(
        child: VStack(
          [
            if (showDragIndicator == true) ExDashLine().pSymmetric(v: 24),
            if (title != null) ...[
              title.text.bold.size(18).maxLines(2).textStyle(titleStyle).ellipsis.make().pOnly(bottom: 8).pSymmetric(h: 24).pOnly(top: showDragIndicator == true ? 0 : 16),
              if (showDivider == true) Divider().pOnly(bottom: 8) else 8.heightBox,
            ],
            content.pSymmetric(h: padding ?? 24),
          ],
        ),
      ).w(double.infinity),
      backgroundColor: backgroundColor ?? Get.theme.cardColor,
      barrierColor: barrierColor,
      isDismissible: isDismissible ?? true,
      persistent: persistent ?? true,
      isScrollControlled: isScrolled ?? true,
      enableDrag: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(radius ?? 16), topRight: Radius.circular(radius ?? 16)),
      ),
    );
  }

  static void dragable({
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
    Get.bottomSheet(
      DraggableScrollableSheet(
        initialChildSize: initialChildSize,
        maxChildSize: 0.9,
        minChildSize: minChildSize,
        builder: (_, controller) => Container(
          decoration: ExDecorator.top(
            radius: radius,
          ),
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
                    ),
                  ).onInkTap(
                    () => {Get.back(), if (onClose != null) onClose() else ''},
                  )
                else
                  const SizedBox(),
                ListView(
                  controller: controller,
                  children: [content],
                ).paddingSymmetric(vertical: 24).expand(),
              ],
            ).p24(),
          ),
        ),
      ),
      elevation: 0,
      isScrollControlled: isScrollControlled,
      isDismissible: true,
    );
  }

  static void list({
    required List<ExKeyValue> data,
    required String title,
    required String keySelected,
    required Function(String, String) callback,
    bool? isFullScreen,
    bool showDivider = true,
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
    Get.bottomSheet(
      SafeArea(
        child: VStack(
          [
            ExDashLine().pOnly(top: 24),
            title.text.bold.size(18).maxLines(2).ellipsis.make().pOnly(top: 24, bottom: 8).pSymmetric(h: 24),
            if (showDivider == true) Divider().pOnly(bottom: 8) else 8.heightBox,
            Expanded(
              child: data.isNotEmpty
                  ? ListView.separated(
                      separatorBuilder: (context, index) => Divider(),
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: data[index].icon,
                          title: data[index].key == keySelected ? data[index].value.text.bold.size(14).make() : data[index].value.text.color(Get.theme.hintColor).size(14).make(),
                          trailing: showTrailing == true
                              ? data[index].key == keySelected
                                  ? Icon(Icons.radio_button_on)
                                  : Icon(Icons.radio_button_off)
                              : null,
                          onTap: () {
                            Get.back();
                            callback(data[index].key, data[index].value);
                          },
                        );
                      },
                    )
                  : onEmpty ?? 0.heightBox,
            ),
          ],
        ),
      ),
      backgroundColor: backgroundColor ?? Get.theme.cardColor,
      barrierColor: barrierColor,
      isDismissible: isDismissible ?? true,
      persistent: persistent ?? true,
      isScrollControlled: isFullScreen ?? false,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(radius ?? 16), topRight: Radius.circular(radius ?? 16)),
      ),
    );
  }
}
