import 'package:ex/ex.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  var isLoading = true;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    3.seconds.delay(() => setState(() => isLoading = false));
    return Scaffold(
      appBar: AppBar(
        title: 'Loading'.text.extraBold.size(16).make(),
        elevation: 0.5,
        leading: IconButton(icon: Icon(Icons.arrow_back_outlined), onPressed: () => Get.back()),
      ),
      body: VStack([
        if (isLoading)
          ExUiShimmerList().expand()
        else
          VStack(
            [
              'DATA LOADED'.text.makeCentered().pOnly(bottom: 16),
              ExButtonOutline(
                label: 'reload',
                onPressed: () {
                  setState(() {
                    isLoading = true;
                    3.seconds.delay(() => setState(() => isLoading = false));
                  });
                },
              ).centered(),
            ],
          ),
      ]).p12(),
    );
  }
}
