import 'package:ex/ex.dart';
import 'package:example/core/index.dart';
import 'package:example/core_gallery/http_page.dart';
import 'package:example/core_gallery/log_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app_themes.dart';
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
import 'helper_gallery/dialog_page.dart';
import 'ui_widget_gallery/loading_page.dart';
import 'ui_widget_gallery/progress_page.dart';
import 'ui_widget_gallery/shimmer_page.dart';
import 'helper_gallery/snackbar_page.dart';
import 'ui_widget_gallery/dropdown_page.dart';
import 'ui_widget_gallery/textfield_page.dart';
import 'ui_widget_gallery/typography_page.dart';
import 'helper_gallery/decoration_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// ExLog
  ExLog.init();

  /// ExHttp
  final baseHeader = {'sample': 'ex'};
  Get.put(
    ExHttp(
      baseURL: 'https://jsonplaceholder.typicode.com',
      baseHeader: baseHeader,
      maxTimeOut: 30.seconds,
      maxAuthRetry: 5,
      allowFollowRedirects: true,
      showLogHeader: false,
      showLogResponse: false,
    ),
  );

  runApp(
    GetMaterialApp(
      title: 'Ex:mple',
      debugShowCheckedModeBanner: false,
      home: Home(),
      theme: AppThemes.light,
      darkTheme: AppThemes.dark,
      themeMode: AppThemes.theme,
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
    'Dropdown': DropdownPage(),
    'TextField': TextFieldPage(),
  };

  final xFeatures2 = {
    'Alert': AlertPage(),
    'Dialog Input': DialogPage(),
    'BottomSheet': BottomSheetPage(),
    'DateTime Picker': DateTimePage(),
    'Decorator': DecorationPage(),
    'SnackBar': SnackbarPage(),
    'Loading Dialog': LoadingDialogPage(),
  };

  final xFeatures3 = {
    'Int': ExtIntPage(),
    'String': ExtStringPage(),
    'List': Scaffold(appBar: AppBar()),
    'Date': Scaffold(appBar: AppBar()),
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
                labelColor: colorBlack,
                unselectedLabelColor: colorNeutral[200],
                isScrollable: true,
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
                separatorBuilder: (BuildContext context, int index) => Divider(),
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
              Divider(),
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
                separatorBuilder: (BuildContext context, int index) => Divider(
                  color: colorNeutral[200],
                ),
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
                separatorBuilder: (BuildContext context, int index) => Divider(),
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
                separatorBuilder: (BuildContext context, int index) => Divider(),
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
