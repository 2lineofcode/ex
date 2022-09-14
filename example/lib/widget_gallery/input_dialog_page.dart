import 'package:ex/ex.dart';

import 'package:flutter/material.dart';

class InputDialogPage extends StatelessWidget {
  const InputDialogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 'Input Dialog'.text.extraBold.size(16).make(),
      ),
      body: VStack([
        'Dialog Input'.text.make().pOnly(bottom: 16),
        ExButtonOutline(
          label: 'SINGLE INPUT',
          width: double.infinity,
          onPressed: () => ExInputDialog.single(
            title: 'Buat Topik',
            questionText: 'Judul Topik',
            helperText: 'Topik dapat berupa apa pun seperti judul materi, tema, KD, dan lainnya.',
            onYes: (output) => ExSnackbar.info(output),
          ),
        ),
      ]).p16().scrollVertical(),
    );
  }
}
