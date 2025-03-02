import 'package:ex_kit/ex.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() {
  testWidgets('Test ExAlert.success', (WidgetTester tester) async {
    await tester.pumpWidget(
      GetMaterialApp(
        home: Builder(
          builder: (context) {
            ExAlert.success(
              title: 'Success',
              message: 'This is a success message.',
              onYes: () {},
            );
            return const SizedBox();
          },
        ),
      ),
    );

    expect(find.text('Success'), findsOneWidget);
    expect(find.text('This is a success message.'), findsOneWidget);
  });

  testWidgets('Test ExAlert.error', (WidgetTester tester) async {
    await tester.pumpWidget(
      GetMaterialApp(
        home: Builder(
          builder: (context) {
            ExAlert.error(
              title: 'Error',
              message: 'This is an error message.',
              onYes: () {},
            );
            return const SizedBox();
          },
        ),
      ),
    );

    expect(find.text('Error'), findsOneWidget);
    expect(find.text('This is an error message.'), findsOneWidget);
  });

  testWidgets('Test ExAlert.confirm', (WidgetTester tester) async {
    await tester.pumpWidget(
      GetMaterialApp(
        home: Builder(
          builder: (context) {
            ExAlert.confirm(
              title: 'Confirm',
              message: 'Do you want to confirm this?',
              onYes: () {},
              onNo: () {},
            );
            return const SizedBox();
          },
        ),
      ),
    );

    expect(find.text('Confirm'), findsOneWidget);
    expect(find.text('Do you want to confirm this?'), findsOneWidget);
  });

  testWidgets('Test ExAlert.custom', (WidgetTester tester) async {
    await tester.pumpWidget(
      GetMaterialApp(
        home: Builder(
          builder: (context) {
            ExAlert.custom(
              content: Text('Custom Alert'),
            );
            return const SizedBox();
          },
        ),
      ),
    );

    expect(find.text('Custom Alert'), findsOneWidget);
  });
}
