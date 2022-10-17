import 'dart:convert';

import 'package:ex/ex.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HttpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final apiService = Get.find<ExHttp>();
    apiService
      ..httpClient.addAuthenticator<void>((request) {
        return request;
      })
      ..httpClient.addRequestModifier<void>((request) {
        final String? token = 'token';
        if (token != null && token.isNotEmpty) {
          request.headers['Authorization'] = 'Bearer $token';
        }
        request.headers.addAll({});
        return request;
      });

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
                  await apiService.httpGet(endPoint: '/todos/1').then((response) {
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
              height: 70,
              child: VStack(
                [
                  '''
/// main.dart
Get.put(ExHttp(baseURL: 'https://api-1.com', baseHeader: {}), tag: 'api1');
Get.put(ExHttp(baseURL: 'https://api-2.com', baseHeader: {}), tag: 'api2');
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
            title: 'GET | POST | PUT | DELETE',
            content: Container(
                height: 120,
                child: '''
await apiService.httpGet(endPoint: '/users').then((response) {
    logI(jsonEncode(response.body));
  }).catchError((e) {
    logE('e);
  });
});
                  '''
                    .selectableText
                    .make()),
          ),
        ],
      ).p12().scrollVertical(),
    );
  }
}
