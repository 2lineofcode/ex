import 'dart:convert';

import 'package:dart_code_viewer2/dart_code_viewer2.dart';
import 'package:ex/ex.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HttpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final apiService = Get.find<ExHttp>();

    return Scaffold(
      appBar: AppBar(
        title: 'ExHttp'.text.extraBold.size(16).make(),
      ),
      body: VStack(
        [
          Wrap(
            children: [
              ExButtonOutline(
                label: 'GET',
                onPressed: () async {
                  await apiService.http(url: 'https://api.github.com', method: Method.GET).then((response) {
                    logI(jsonEncode(response.body));
                    ExSnackbar.success(jsonEncode(response.body));
                  });
                },
              ).pOnly(right: 12, bottom: 12),
              ExButtonOutline(
                label: 'POST',
              ).pOnly(right: 12, bottom: 12),
              ExButtonOutline(
                label: 'PUT',
              ).pOnly(right: 12, bottom: 12),
              ExButtonOutline(
                label: 'DELETE',
              ).pOnly(right: 12, bottom: 12),
              ExButtonOutline(
                label: 'UPLOAD',
              ).pOnly(right: 12, bottom: 12),
              ExButtonOutline(
                label: 'DOWNLOAD',
              ).pOnly(right: 12, bottom: 12),
            ],
          ),

          /// 1
          ExAccordion(
            showAccordion: true,
            title: 'INIT',
            content: Container(
              height: 180,
              child: VStack(
                [
                  '''
/// main.dart
Get.put(
  ExHttp(
    baseURL: 'https://api.com',
    baseHeader: {},
    maxTimeOut: 30.seconds,
    maxAuthRetry: 5,
    allowFollowRedirects: true,
    showLogHeader: false,
    showLogResponse: false,
  ),
);
    '''
                      .selectableText
                      .make(),
                ],
              ).scrollVertical(),
            ),
          ),

          /// 2
          ExAccordion(
            showAccordion: true,
            title: 'GET',
            content: Container(
              height: 120,
              child: DartCodeViewer(
                '''
 await apiService.httpGet(endPoint: '/users').then((response) {
  logI(jsonEncode(response.body));
  ExSnackbar.success(jsonEncode(response.body));
});
                  ''',
                showCopyButton: false,
              ),
            ),
          ),
        ],
      ).p12().scrollVertical(),
    );
  }
}
