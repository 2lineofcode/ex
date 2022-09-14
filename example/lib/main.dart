import 'package:ex/ex.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app_themes.dart';
import 'widget_gallery/__test_page.dart';
import 'widget_gallery/alert_page.dart';
import 'widget_gallery/avatar_page.dart';
import 'widget_gallery/bottomsheet_page.dart';
import 'widget_gallery/button_page.dart';
import 'widget_gallery/divider_page.dart';
import 'widget_gallery/error_or_empty_page.dart';
import 'widget_gallery/imageview_page.dart';
import 'widget_gallery/input_dialog_page.dart';
import 'widget_gallery/loading_page.dart';
import 'widget_gallery/progress_page.dart';
import 'widget_gallery/shimmer_page.dart';
import 'widget_gallery/snackbar_page.dart';
import 'widget_gallery/textfield_page.dart';
import 'widget_gallery/timeline_page.dart';
import 'widget_gallery/typography_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    GetMaterialApp(
      title: 'Application',
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
  final xFeatures = {
    '# Typograph': TypographyPage(),
    'Alert': AlertPage(),
    'Avatar': AvatarPage(),
    'BottomSheet': BottomSheetPage(),
    'Button': ButtonPage(),
    'Dialog Input': InputDialogPage(),
    'Divider': DividerPage(),
    'ErrorOrEmpty': ErrorOrEmptyPage(),
    'ImageView': ImageViewPage(),
    'ListView': TestPage(),
    'Loading Page': LoadingPage(),
    'Progress': ProgressPage(),
    'Shimmer': ShimmerPage(),
    'SnackBar': SnackbarPage(),
    'TextField': TextFieldPage(),
    'TimeLine': TimeLinePage(),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 'Ex Plug-in Galery'.text.extraBold.size(16).make(),
        elevation: 0.5,
      ),
      body: VStack([
        ListView.separated(
          itemCount: xFeatures.length,
          separatorBuilder: (BuildContext context, int index) => Divider(),
          itemBuilder: (context, index) {
            final data = xFeatures.entries.toList();
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
    );
  }
}
