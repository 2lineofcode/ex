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
    required Widget childrenWidget,
    String? title,
    int titleMaxLine = 999,
    BSHeaderType headerType = BSHeaderType.dash,
    MainAxisAlignment alignment = MainAxisAlignment.spaceBetween,
    bool iconPositionOnLeft = false,
  }) {
    // add haptic feedback (UX)
    HapticFeedback.lightImpact();
    Get.bottomSheet(
      Container(
        decoration: ExDecorator.boxBottomSheet(),
        child: VStack(
          [
            if (headerType == BSHeaderType.dash)
              VStack(
                [
                  ExDashLine(),
                  if (title != null) title.text.bold.size(18).maxLines(titleMaxLine).make().pOnly(top: 24),
                ],
              )
            else
              HStack(
                [
                  if (title != null) title.text.color(Colors.black).maxLines(titleMaxLine).size(18).bold.make().pOnly(top: 24),
                  IconButton(
                    onPressed: Get.back,
                    icon: const Icon(
                      Icons.close_rounded,
                      size: 30,
                      color: Colors.grey,
                    ),
                  ),
                ],
                alignment: alignment,
              ).w(double.infinity - 48),
            Wrap(children: [childrenWidget]).pOnly(top: 24),
          ],
        ).p24(),
      ),
      elevation: 10,
      isScrollControlled: true,
    );
  }

  static void dragable({
    required Widget childrenWidget,
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
                children: [childrenWidget],
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
    bool? showTotalData = false,
    bool isFullScreen = false,
    required Function(String, String) callback,
    String? emptyMessage = 'Tidak ada data',
    String? emptySvgAsset,
    Function? emptyCallback,
    double? radius = 16,
  }) {
    // add haptic feedback (UX)
    HapticFeedback.lightImpact();
    final totalData = data.length;
    Get.bottomSheet(
      Container(
        decoration: ExDecorator.boxBottomSheet(),
        child: VStack(
          [
            const ExDashLine().p24(),
            8.heightBox,
            if (showTotalData == true) '$title ($totalData)'.text.size(18).semiBold.make().paddingOnly(left: 24, right: 24) else title.text.size(18).semiBold.make().paddingOnly(left: 24, right: 24),
            12.heightBox,
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
                        ).pSymmetric(h: 24);
                      },
                    )
                  : VStack([
                      100.heightBox,
                      ExUiErrorOrEmpty(
                        title: '$emptyMessage',
                        callback: () => emptyCallback?.call(),
                      ).centered(),
                    ]).scrollVertical(),
            ),
          ],
        ),
      ),
      isScrollControlled: isFullScreen,
    );
  }
}
