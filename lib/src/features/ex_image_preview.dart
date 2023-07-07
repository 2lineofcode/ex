// ignore_for_file: library_private_types_in_public_api

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';

import '../../ex.dart';

mixin ExImagePreview {
  static void showUrl(String url, {Map<String, String>? header}) {
    showGeneralDialog(
      context: Get.context!,
      barrierColor: Colors.black,
      barrierDismissible: true,
      barrierLabel: 'Dialog',
      transitionDuration: Duration(milliseconds: 300),
      pageBuilder: (context, __, ___) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            leading: 0.heightBox,
            actions: [IconButton(onPressed: () => Get.back(), icon: Icon(Icons.close, color: Colors.white))],
          ),
          backgroundColor: Colors.black.withOpacity(0.2),
          body: Dismissible(
            key: Key(''),
            direction: DismissDirection.vertical,
            onDismissed: (_) => Get.back(),
            child: SafeArea(
              child: Stack(
                children: [
                  PhotoView(
                    backgroundDecoration: BoxDecoration(color: Colors.transparent),
                    imageProvider: NetworkImage(url),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static void showBase64(String base64, {Map<String, String>? header}) {
    showGeneralDialog(
      context: Get.context!,
      barrierColor: Colors.black.withOpacity(0.8),
      barrierDismissible: true,
      barrierLabel: 'Dialog',
      transitionDuration: Duration(milliseconds: 300),
      pageBuilder: (context, __, ___) {
        return Scaffold(
          backgroundColor: Colors.black.withOpacity(0.2),
          body: SafeArea(
            child: Stack(
              children: [
                PhotoView(
                  backgroundDecoration: BoxDecoration(color: Colors.transparent),
                  imageProvider: Image.memory(base64Decode(base64)).image,
                ),
                HStack(
                  [
                    Spacer(),
                    CloseButton(color: Colors.white).p8(),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
