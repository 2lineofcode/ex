import 'package:ex/src/features/ex_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() {
  testWidgets('Neutral (Success / Info) Alert Test', (WidgetTester tester) async {
    // prepare the texts
    const titleText = 'Title';
    const messageText = 'Message';
    const btnOkText = 'Button OK';
    const btnAlertText = 'Title & Message';
    const tapTargetKey = Key('tap-target');

    // build initial widget
    await tester.pumpWidget(
      GetMaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (BuildContext context) {
              return ElevatedButton(
                key: tapTargetKey,
                child: Text(btnAlertText),
                onPressed: () => ExAlert.success(
                  title: titleText,
                  message: messageText,
                  btnOkText: btnOkText,
                ),
              );
            },
          ),
        ),
      ),
    );

    // initial test
    expect(
      find.text(btnAlertText),
      findsWidgets,
      reason: 'button should appear as trigger of alert pop up',
    );

    // 1st action - tap the button to show alert pop up
    await tester.tap(find.byKey(tapTargetKey)); // an action => show the pop up
    await tester.pump(); // rebuilds the widget

    // 1st test - make sure alert pop up and its components are displayed properly
    expect(
      find.text(titleText),
      findsWidgets,
      reason: 'this text widget should appear as title of alert pop up',
    );
    expect(
      find.text(messageText),
      findsWidgets,
      reason: 'this text widget should appear as message of alert pop up',
    );
    expect(
      find.text(btnOkText),
      findsWidgets,
      reason: 'this text widget should appear as OK button of alert pop up',
    );

    // 2nd action - tap the area outside the alert pop up to close it,
    // but it won't, because the pop up is non dismissible by default
    // Offset(10, 10) is considered outside of AlertDialog area
    await tester.tapAt(
      Offset(
        10,
        10,
      ),
    ); // an action => attempt to close the pop up by tap area outside pop up
    await tester.pump(); // rebuilds the widget

    // 2nd test - make sure alert pop up and its components are displayed properly
    expect(
      find.text(titleText),
      findsWidgets,
      reason: 'this text widget should still appear',
    );
    expect(
      find.text(messageText),
      findsWidgets,
      reason: 'this text widget should still appear',
    );
    expect(
      find.text(btnOkText),
      findsWidgets,
      reason: 'this text widget should still appear',
    );

    // 3rd action - tap the close button to close the pop up
    await tester.tap(find.text(btnOkText)); // an action => close the pop up
    await tester.pump(); // rebuilds the widget

    // 3rd test - make sure alert pop up closed
    expect(
      find.text(titleText),
      findsNothing,
      reason: 'alert pop up should disappear',
    );
    expect(
      find.text(messageText),
      findsNothing,
      reason: 'alert pop up should disappear',
    );
    expect(
      find.text(btnOkText),
      findsNothing,
      reason: 'alert pop up should disappear',
    );

    // end of test
  });

  testWidgets('Neutral (Success / Info) Alert - dismissible Test', (WidgetTester tester) async {
    // prepare the texts
    const titleText = 'Title';
    const messageText = 'Message';
    const btnOkText = 'Button OK';
    const btnAlertText = 'Title & Message';
    const tapTargetKey = Key('tap-target');

    // build initial widget
    await tester.pumpWidget(
      GetMaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (BuildContext context) {
              return ElevatedButton(
                key: tapTargetKey,
                child: Text(btnAlertText),
                onPressed: () => ExAlert.success(
                  title: titleText,
                  message: messageText,
                  btnOkText: btnOkText,
                ),
              );
            },
          ),
        ),
      ),
    );

    // initial test
    expect(
      find.text(btnAlertText),
      findsWidgets,
      reason: 'button should appear as trigger of alert pop up',
    );

    // 1st action - tap the button to show alert pop up
    await tester.tap(find.byKey(tapTargetKey)); // an action => show the pop up
    await tester.pump(); // rebuilds the widget

    // 1st test - make sure alert pop up and its components are displayed properly
    expect(
      find.text(titleText),
      findsWidgets,
      reason: 'this text widget should appear as title of alert pop up',
    );
    expect(
      find.text(messageText),
      findsWidgets,
      reason: 'this text widget should appear as message of alert pop up',
    );
    expect(
      find.text(btnOkText),
      findsWidgets,
      reason: 'this text widget should appear as OK button of alert pop up',
    );
    expect(
      find.byType(SvgPicture),
      findsWidgets,
      reason: 'this text widget should appear as image of alert pop up',
    );

    // 2nd action - tap the area outside the alert pop up to close it
    // Offset(10, 10) is considered outside of AlertDialog area
    await tester.tapAt(Offset(10, 10)); // an action => close the pop up
    await tester.pump(); // rebuilds the widget

    // 2nd test - make sure alert pop up closed
    expect(
      find.text(titleText),
      findsNothing,
      reason: 'alert pop up should disappear',
    );
    expect(
      find.text(messageText),
      findsNothing,
      reason: 'alert pop up should disappear',
    );
    expect(
      find.text(btnOkText),
      findsNothing,
      reason: 'alert pop up should disappear',
    );

    // end of test
  });

  testWidgets('Confirm Alert Test', (WidgetTester tester) async {
    // prepare the texts
    const titleText = 'Title';
    const messageText = 'Message';
    const btnConfirmText = 'Confirm';
    const btnCancelText = 'Cancel';
    const btnAlertText = 'Title & Message';
    const tapTargetKey = Key('tap-target');

    // build initial widget
    await tester.pumpWidget(
      GetMaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (BuildContext context) {
              return ElevatedButton(
                key: tapTargetKey,
                child: Text(btnAlertText),
                onPressed: () => ExAlert.confirm(
                  title: titleText,
                  message: messageText,
                  btnYesText: btnConfirmText,
                  btnNoText: btnCancelText,
                  onNo: Get.back,
                  onYes: Get.back,
                ),
              );
            },
          ),
        ),
      ),
    );

    // initial test
    expect(
      find.text(btnAlertText),
      findsWidgets,
      reason: 'button should appear as trigger of alert pop up',
    );

    // 1st action - tap the button to show alert pop up
    await tester.tap(find.byKey(tapTargetKey)); // an action => show the pop up
    await tester.pump(); // rebuilds the widget

    // 1st test - make sure alert pop up and its components are displayed properly
    expect(
      find.text(titleText),
      findsWidgets,
      reason: 'this text widget should appear as title of alert pop up',
    );
    expect(
      find.text(messageText),
      findsWidgets,
      reason: 'this text widget should appear as message of alert pop up',
    );
    expect(
      find.text(btnConfirmText),
      findsWidgets,
      reason: 'this text widget should appear as Confirm button of alert pop up',
    );
    expect(
      find.text(btnCancelText),
      findsWidgets,
      reason: 'this text widget should appear as Cancel button of alert pop up',
    );

    // 2nd action - tap the area outside the alert pop up to close it,
    // but it won't, because the pop up is non dismissible by default
    // Offset(10, 10) is considered outside of AlertDialog area
    await tester.tapAt(
      Offset(
        10,
        10,
      ),
    ); // an action => attempt to close the pop up by tap area outside pop up
    await tester.pump(); // rebuilds the widget

    // 2nd test - make sure alert pop up and its components are displayed properly
    expect(
      find.text(titleText),
      findsWidgets,
      reason: 'this text widget should still appear',
    );
    expect(
      find.text(messageText),
      findsWidgets,
      reason: 'this text widget should still appear',
    );
    expect(
      find.text(btnConfirmText),
      findsWidgets,
      reason: 'this text widget should still appear',
    );
    expect(
      find.text(btnCancelText),
      findsWidgets,
      reason: 'this text widget should still appear',
    );

    // 3rd action - tap the cancel button to close the pop up
    await tester.tap(find.text(btnCancelText)); // an action => close the pop up
    await tester.pump(); // rebuilds the widget

    // 3rd test - make sure alert pop up closed
    expect(
      find.text(titleText),
      findsNothing,
      reason: 'alert pop up should disappear',
    );
    expect(
      find.text(messageText),
      findsNothing,
      reason: 'alert pop up should disappear',
    );
    expect(
      find.text(btnConfirmText),
      findsNothing,
      reason: 'alert pop up should disappear',
    );
    expect(
      find.text(btnCancelText),
      findsNothing,
      reason: 'alert pop up should disappear',
    );

    // 4th action - tap the button to show alert pop up (again)
    await tester.tap(find.byKey(tapTargetKey)); // an action => show the pop up
    await tester.pump(); // rebuilds the widget

    // 4th test - make sure alert pop up and its components are displayed properly (again)
    expect(
      find.text(titleText),
      findsWidgets,
      reason: 'this text widget should appear as title of alert pop up',
    );
    expect(
      find.text(messageText),
      findsWidgets,
      reason: 'this text widget should appear as message of alert pop up',
    );
    expect(
      find.text(btnConfirmText),
      findsWidgets,
      reason: 'this text widget should appear as Confirm button of alert pop up',
    );
    expect(
      find.text(btnCancelText),
      findsWidgets,
      reason: 'this text widget should appear as Cancel button of alert pop up',
    );

    // 5th action - tap the confirm button to run function or close the pop up
    await tester.tap(find.text(btnConfirmText)); // an action => close the pop up
    await tester.pump(); // rebuilds the widget

    // 5th test - make sure alert pop up closed
    expect(
      find.text(titleText),
      findsNothing,
      reason: 'alert pop up should disappear',
    );
    expect(
      find.text(messageText),
      findsNothing,
      reason: 'alert pop up should disappear',
    );
    expect(
      find.text(btnConfirmText),
      findsNothing,
      reason: 'alert pop up should disappear',
    );
    expect(
      find.text(btnCancelText),
      findsNothing,
      reason: 'alert pop up should disappear',
    );

    // end of test
  });

  testWidgets('Confirm Alert - dismissible Test', (WidgetTester tester) async {
    // prepare the texts
    const titleText = 'Title';
    const messageText = 'Message';
    const btnConfirmText = 'Confirm';
    const btnCancelText = 'Cancel';
    const btnAlertText = 'Title & Message';
    const tapTargetKey = Key('tap-target');

    // build initial widget
    await tester.pumpWidget(
      GetMaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (BuildContext context) {
              return ElevatedButton(
                key: tapTargetKey,
                child: Text(btnAlertText),
                onPressed: () => ExAlert.confirm(
                  title: titleText,
                  message: messageText,
                  btnYesText: btnConfirmText,
                  btnNoText: btnCancelText,
                  onNo: Get.back,
                  onYes: Get.back,
                ),
              );
            },
          ),
        ),
      ),
    );

    // initial test
    expect(
      find.text(btnAlertText),
      findsWidgets,
      reason: 'button should appear as trigger of alert pop up',
    );

    // 1st action - tap the button to show alert pop up
    await tester.tap(find.byKey(tapTargetKey)); // an action => show the pop up
    await tester.pump(); // rebuilds the widget

    // 1st test - make sure alert pop up and its components are displayed properly
    expect(
      find.text(titleText),
      findsWidgets,
      reason: 'this text widget should appear as title of alert pop up',
    );
    expect(
      find.text(messageText),
      findsWidgets,
      reason: 'this text widget should appear as message of alert pop up',
    );
    expect(
      find.text(btnConfirmText),
      findsWidgets,
      reason: 'this text widget should appear as Confirm button of alert pop up',
    );
    expect(
      find.text(btnCancelText),
      findsWidgets,
      reason: 'this text widget should appear as Cancel button of alert pop up',
    );
    expect(
      find.byType(SvgPicture),
      findsWidgets,
      reason: 'this text widget should appear as image of alert pop up',
    );

    // 2nd action - tap the area outside the alert pop up to close it
    // Offset(10, 10) is considered outside of AlertDialog area
    await tester.tapAt(Offset(10, 10)); // an action => close the pop up
    await tester.pump(); // rebuilds the widget

    // 2nd test - make sure alert pop up closed
    expect(
      find.text(titleText),
      findsNothing,
      reason: 'alert pop up should disappear',
    );
    expect(
      find.text(messageText),
      findsNothing,
      reason: 'alert pop up should disappear',
    );
    expect(
      find.text(btnConfirmText),
      findsNothing,
      reason: 'alert pop up should disappear',
    );
    expect(
      find.text(btnCancelText),
      findsNothing,
      reason: 'alert pop up should disappear',
    );
    expect(
      find.byType(SvgPicture),
      findsNothing,
      reason: 'alert pop up should disappear',
    );

    // end of test
  });

  testWidgets('Error Alert Test', (WidgetTester tester) async {
    // prepare the texts
    const titleText = 'Title';
    const messageText = 'Message';
    const btnConfirmText = 'Confirm';
    const btnAlertText = 'Title & Message';
    const tapTargetKey = Key('tap-target');

    // build initial widget
    await tester.pumpWidget(
      GetMaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (BuildContext context) {
              return ElevatedButton(
                key: tapTargetKey,
                child: Text(btnAlertText),
                onPressed: () => ExAlert.error(
                  title: titleText,
                  message: messageText,
                  btnYesText: btnConfirmText,
                  onYes: Get.back,
                ),
              );
            },
          ),
        ),
      ),
    );

    // initial test
    expect(
      find.text(btnAlertText),
      findsWidgets,
      reason: 'button should appear as trigger of alert pop up',
    );

    // 1st action - tap the button to show alert pop up
    await tester.tap(find.byKey(tapTargetKey)); // an action => show the pop up
    await tester.pump(); // rebuilds the widget

    // 1st test - make sure alert pop up and its components are displayed properly
    expect(
      find.text(titleText),
      findsWidgets,
      reason: 'this text widget should appear as title of alert pop up',
    );
    expect(
      find.text(messageText),
      findsWidgets,
      reason: 'this text widget should appear as message of alert pop up',
    );
    expect(
      find.text(btnConfirmText),
      findsWidgets,
      reason: 'this text widget should appear as Confirm button of alert pop up',
    );

    // 2nd action - tap the area outside the alert pop up to close it,
    // but it won't, because the pop up is non dismissible by default
    // Offset(10, 10) is considered outside of AlertDialog area
    await tester.tapAt(
      Offset(
        10,
        10,
      ),
    ); // an action => attempt to close the pop up by tap area outside pop up
    await tester.pump(); // rebuilds the widget

    // 2nd test - make sure alert pop up and its components are displayed properly
    expect(
      find.text(titleText),
      findsWidgets,
      reason: 'this text widget should still appear',
    );
    expect(
      find.text(messageText),
      findsWidgets,
      reason: 'this text widget should still appear',
    );
    expect(
      find.text(btnConfirmText),
      findsWidgets,
      reason: 'this text widget should still appear',
    );

    // 3rd action - tap the confirm button to close the pop up
    await tester.tap(find.text(btnConfirmText)); // an action => close the pop up
    await tester.pump(); // rebuilds the widget

    // 3rd test - make sure alert pop up closed
    expect(
      find.text(titleText),
      findsNothing,
      reason: 'alert pop up should disappear',
    );
    expect(
      find.text(messageText),
      findsNothing,
      reason: 'alert pop up should disappear',
    );
    expect(
      find.text(btnConfirmText),
      findsNothing,
      reason: 'alert pop up should disappear',
    );

    // end of test
  });

  testWidgets('Error Alert - dismissible Test', (WidgetTester tester) async {
    // prepare the texts
    const titleText = 'Title';
    const messageText = 'Message';
    const btnConfirmText = 'Confirm';
    const btnAlertText = 'Title & Message';
    const tapTargetKey = Key('tap-target');

    // build initial widget
    await tester.pumpWidget(
      GetMaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (BuildContext context) {
              return ElevatedButton(
                key: tapTargetKey,
                child: Text(btnAlertText),
                onPressed: () => ExAlert.error(
                  title: titleText,
                  message: messageText,
                  btnYesText: btnConfirmText,
                  onYes: Get.back,
                ),
              );
            },
          ),
        ),
      ),
    );

    // initial test
    expect(
      find.text(btnAlertText),
      findsWidgets,
      reason: 'button should appear as trigger of alert pop up',
    );

    // 1st action - tap the button to show alert pop up
    await tester.tap(find.byKey(tapTargetKey)); // an action => show the pop up
    await tester.pump(); // rebuilds the widget

    // 1st test - make sure alert pop up and its components are displayed properly
    expect(
      find.text(titleText),
      findsWidgets,
      reason: 'this text widget should appear as title of alert pop up',
    );
    expect(
      find.text(messageText),
      findsWidgets,
      reason: 'this text widget should appear as message of alert pop up',
    );
    expect(
      find.text(btnConfirmText),
      findsWidgets,
      reason: 'this text widget should appear as Confirm button of alert pop up',
    );
    expect(
      find.byType(SvgPicture),
      findsWidgets,
      reason: 'this text widget should appear as image of alert pop up',
    );

    // 2nd action - tap the area outside the alert pop up to close it
    // Offset(10, 10) is considered outside of AlertDialog area
    await tester.tapAt(Offset(10, 10)); // an action => close the pop up
    await tester.pump(); // rebuilds the widget

    // 2nd test - make sure alert pop up closed
    expect(
      find.text(titleText),
      findsNothing,
      reason: 'alert pop up should disappear',
    );
    expect(
      find.text(messageText),
      findsNothing,
      reason: 'alert pop up should disappear',
    );
    expect(
      find.text(btnConfirmText),
      findsNothing,
      reason: 'alert pop up should disappear',
    );
    expect(
      find.byType(SvgPicture),
      findsNothing,
      reason: 'alert pop up should disappear',
    );

    // end of test
  });
}
