// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:velocity_x/velocity_x.dart';


/*
 * ExImagePreview
 * Created by Aditya Pratama
 * https://adit.web.id
 *
 * Copyright (c) 2021 MDVK, LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 *
 *
 * -- example implementation --
 *
 * ```dart
 * ExImagePreview.show(context: context, arrayUrl: ['https://logowik.com/content/uploads/images/flutter5786.jpg']);
 * ```
 */
class ExImagePreview extends StatefulWidget {
  ExImagePreview({
    Key? key,
    required this.listUrl,
    this.header,
    this.separationText,
  }) : super(key: key);

  final List<String> listUrl;
  final Map<String, String>? header;
  final String? separationText;

  final pageController = PageController();

  @override
  _ExImagePreviewState createState() => _ExImagePreviewState();

  /// -- example implementation --
  /// ```dart
  /// ExImagePreview.show(context: context, arrayUrl: ['https://logowik.com/content/uploads/images/flutter5786.jpg']);
  /// ```
  static void show({
    required BuildContext context,
    required List<String> arrayUrl,
    Map<String, String>? header,
    String? separationText,
  }) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ExImagePreview(
          listUrl: arrayUrl,
          header: header,
          separationText: separationText,
        ),
      ),
    );
  }
}

class _ExImagePreviewState extends State<ExImagePreview> {
  late int currentIndex = 0;

  void onPageChanged(int index) => setState(() => currentIndex = index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          // IconButton(
          //   onPressed: () => download(url: widget.listUrl[currentIndex]),
          //   icon: const Icon(Icons.file_download, color: Colors.white),
          // ).pOnly(right: 12),
          // IconButton(
          //   icon: const Icon(Icons.more_vert, color: Colors.white),
          //   onPressed: () => controller.shareImage(),
          // ).pOnly(right: 4),
        ],
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            child: PhotoViewGallery.builder(
              scrollPhysics: const BouncingScrollPhysics(),
              builder: (BuildContext context, int index) {
                return PhotoViewGalleryPageOptions(
                  imageProvider: NetworkImage(widget.listUrl[index]),
                  initialScale: PhotoViewComputedScale.contained * 0.8,
                  minScale: PhotoViewComputedScale.contained * 0.8,
                  maxScale: PhotoViewComputedScale.covered * 1.1,
                  // heroAttributes: HeroAttributes(tag: galleryItems[index].id),
                );
              },
              itemCount: widget.listUrl.length,
              loadingBuilder: (context, progress) => Center(child: SizedBox(width: 20.0, height: 20.0, child: CircularProgressIndicator())),
              backgroundDecoration: BoxDecoration(color: Colors.black45),
              pageController: widget.pageController,
              onPageChanged: onPageChanged,
            ),
          ),
          if (widget.listUrl.length > 1)
            HStack([
              Spacer(),
              '${currentIndex + 1} ${widget.separationText ?? 'dari'} ${widget.listUrl.length}'.text.white.make().pOnly(bottom: 32, right: 24),
            ]),
        ],
      ),
    );
  }
}
