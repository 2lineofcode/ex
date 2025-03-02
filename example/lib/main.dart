import 'package:ex_kit/ex.dart';
import 'package:example/app_themes.dart';
import 'package:example/core_gallery/http_page.dart';
import 'package:example/core_gallery/log_page.dart';
import 'package:example/ext_gallery/ext_date_page.dart';
import 'package:example/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'ext_gallery/ext_int_page.dart';
import 'ext_gallery/ext_string_page.dart';
import 'helper_gallery/loading_dialog_page.dart';
import 'ui_widget_gallery/accordion_page.dart';
import 'helper_gallery/datetime_picker_page.dart';
import 'helper_gallery/alert_page.dart';
import 'ui_widget_gallery/avatar_page.dart';
import 'helper_gallery/bottomsheet_page.dart';
import 'ui_widget_gallery/button_page.dart';
import 'ui_widget_gallery/divider_page.dart';
import 'ui_widget_gallery/error_or_empty_page.dart';
import 'ui_widget_gallery/imageview_page.dart';
import 'ui_widget_gallery/loading_page.dart';
import 'ui_widget_gallery/progress_page.dart';
import 'ui_widget_gallery/shimmer_page.dart';
import 'helper_gallery/snackbar_page.dart';
import 'ui_widget_gallery/textfield_page.dart';
import 'ui_widget_gallery/typography_page.dart';
import 'helper_gallery/decoration_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  /// ExHttp
  Get.put(
    ExHttp(baseURL: 'https://jsonplaceholder.typicode.com'),
  );

  runApp(
    GetMaterialApp(
      title: 'Ex:mple',
      debugShowCheckedModeBanner: false,
      home: Home(),
      themeMode: AppThemes.theme,
      theme: AppThemes.dark,
      darkTheme: AppThemes.dark,
      builder: (context, child) {
        return Scaffold(
          body: Stack(
            children: [
              child!,
              IconButton(
                icon: Icon(Icons.brightness_2_rounded),
                onPressed: () async {
                  Get.changeTheme(
                    Get.isDarkMode ? AppThemes.light : AppThemes.dark,
                  );
                  await 500.milliseconds.delay();
                  Get.forceAppUpdate();
                },
              ).positioned(right: 16, top: 16),
            ],
          ),
        );
      },
    ),
  );
}

class Home extends GetView {
  Home({Key? key}) : super(key: key);
  final xFeatures1 = {
    '# Typograph': TypographyPage(),
    'Accordion': AccordionPage(),
    'Avatar': AvatarPage(),
    'Button': ButtonPage(),
    'Divider': DividerPage(),
    'ErrorOrEmpty': ErrorOrEmptyPage(),
    'ImageView': ImageViewPage(),
    'Loading Page': LoadingPage(),
    'Progress': ProgressPage(),
    'Shimmer': ShimmerPage(),
    'TextField': TextFieldPage(),
  };

  final xFeatures2 = {
    'Alert': AlertPage(),
    'BottomSheet': BottomSheetPage(),
    'DateTime Picker': DateTimePage(),
    'Decorator': DecorationPage(),
    'SnackBar': SnackbarPage(),
    'Loading Dialog': LoadingDialogPage(),
  };

  final xFeatures3 = {
    'String': ExtStringPage(),
    'Date': ExtDatePage(),
    'Int': ExtIntPage(),
  };
  final xFeatures4 = {
    'Log': LogPage(),
    'Http': HttpPage(),
  };

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: 'Ex:mple (Material3)'.text.extraBold.size(16).make(),
          elevation: 0.5,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(40),
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                tabs: [
                  'UI/Widget'.text.make().p16(),
                  'Helper'.text.make().p16(),
                  'Extension'.text.make().p16(),
                  'Core'.text.make().p16(),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            /// tab 1
            VStack([
              ListView.separated(
                itemCount: xFeatures1.length,
                separatorBuilder: (context, index) => Divider(),
                itemBuilder: (context, index) {
                  final data = xFeatures1.entries.toList();
                  return ListTile(
                    leading: Icon(Icons.folder_outlined),
                    title: data[index].key.text.make(),
                    minVerticalPadding: 2,
                    minLeadingWidth: 16,
                    onTap: () => Get.to(() => data[index].value),
                  );
                },
              ).expand(),
            ]).p24(),

            /// tab 2
            VStack([
              ListTile(
                leading: Icon(Icons.folder_outlined),
                title: 'ImagePreview'.text.make(),
                minLeadingWidth: 16,
                onTap: () => ExImagePreview.showUrl(
                  'https://asset.kompas.com/crops/7z-QN6nlfPhhYas60AA5tQXDu7Y=/0x0:1350x900/750x500/data/photo/2020/11/13/5fae5fa6b09bb.jpg',
                ),
              ),
              Divider(),
              ListView.separated(
                itemCount: xFeatures2.length,
                separatorBuilder: (context, index) => Divider(),
                itemBuilder: (context, index) {
                  final data = xFeatures2.entries.toList();
                  return ListTile(
                    leading: Icon(Icons.folder_outlined),
                    title: data[index].key.text.make(),
                    minVerticalPadding: 2,
                    minLeadingWidth: 16,
                    onTap: () => Get.to(() => data[index].value),
                  );
                },
              ).expand(),
            ]).p24(),

            /// tab 3
            VStack([
              ListView.separated(
                itemCount: xFeatures3.length,
                separatorBuilder: (context, index) => Divider(),
                itemBuilder: (context, index) {
                  final data = xFeatures3.entries.toList();
                  return ListTile(
                    leading: Icon(Icons.folder_outlined),
                    title: data[index].key.text.make(),
                    minVerticalPadding: 2,
                    minLeadingWidth: 16,
                    onTap: () => Get.to(() => data[index].value),
                  );
                },
              ).expand(),
            ]).p24(),

            /// tab 4
            VStack([
              ListView.separated(
                itemCount: xFeatures4.length,
                separatorBuilder: (context, index) => Divider(),
                itemBuilder: (context, index) {
                  final data = xFeatures4.entries.toList();
                  return ListTile(
                    leading: Icon(Icons.folder_outlined),
                    title: data[index].key.text.make(),
                    minVerticalPadding: 2,
                    minLeadingWidth: 16,
                    onTap: () => Get.to(() => data[index].value),
                  );
                },
              ).expand(),
            ]).p24(),
          ],
        ),
      ),
    );
  }
}
