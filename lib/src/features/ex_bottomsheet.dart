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
    Color? backgroundColor,
    Color? barrierColor,
    bool? isDismissible,
    bool? isFullScreen,
    bool? persistent,
    double? radius,
  }) {
    // add haptic feedback (UX)
    HapticFeedback.lightImpact();
    Get.bottomSheet(
      VStack(
        [
          ExDashLine(),
          if (title != null) ...[
            title.text.bold.black.size(18).maxLines(2).ellipsis.make().pOnly(top: 24, bottom: 8),
            Divider().pOnly(bottom: 8),
          ],
          content,
        ],
      ).p24(),
      // isScrollControlled: true,
      backgroundColor: backgroundColor ?? Colors.white,
      barrierColor: barrierColor,
      isDismissible: isDismissible ?? true,
      persistent: persistent ?? true,
      isScrollControlled: isFullScreen ?? false,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: backgroundColor ?? Colors.white),
        borderRadius: BorderRadius.circular(radius ?? 24),
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
          decoration: ExDecorator.boxBottomSheet(radius: radius),
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
      elevation: 10,
      isScrollControlled: isScrollControlled,
      isDismissible: true,
    );
  }

  static void list({
    required List<ExKeyValue> data,
    required String title,
    required String keySelected,
    required Function(String, String) callback,
    bool isFullScreen = false,
    Widget? onEmpty,
    double? radius = 16,
  }) {
    // add haptic feedback (UX)
    HapticFeedback.lightImpact();
    Get.bottomSheet(
      Container(
        decoration: ExDecorator.boxBottomSheet(),
        child: VStack(
          [
            ExDashLine().pOnly(top: 24),
            title.text.bold.black.size(18).maxLines(2).ellipsis.make().pOnly(top: 24, bottom: 8),
            Divider().pOnly(bottom: 8),
            Expanded(
              child: data.isNotEmpty
                  ? ListView.separated(
                      separatorBuilder: (context, index) => const Divider(),
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: data[index].key == keySelected ? data[index].value.text.bold.size(14).make() : data[index].value.text.size(14).make(),
                          trailing: data[index].key == keySelected ? Icon(Icons.radio_button_on) : Icon(Icons.radio_button_off),
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
        ).pSymmetric(h: 24),
      ),
      isScrollControlled: isFullScreen,
    );
  }
}
