import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../ex.dart';

///   created               : Aditya Pratama
///   originalFilename      : ex_text_field_multiline
///   date                  : 24 Jun 2021
///   —————————————————————————————————————————————————————————————————————————————
///   <img width="348" alt="image" src="https://user-images.githubusercontent.com/36602270/169626780-fc30e64c-6f53-46b7-a1d3-d131692fedaf.png">

class ExTextFieldMultiline extends StatelessWidget {
  const ExTextFieldMultiline({
    super.key,
    this.borderColor = const Color(0xFFe4e8eb),
    this.hint,
    this.controller,
    this.onChanged,
    this.onSubmitted,
    this.onEditingComplete,
    this.enabled,
    this.fillColor = Colors.transparent,
    this.textInputAction,
    this.minLine = 4,
    this.maxLine = 4,
    this.keyboardType = TextInputType.multiline,
    this.autocorrect,
    this.autofocus,
    this.validator,
    this.clear = true,
    this.contentPaddingLeft = 16,
    this.contentPaddingRight = 16,
    this.borderRadius = 12,
    this.labelText,
    this.labelTextStyle = const TextStyle(fontSize: 14),
    this.labelIcon,
    this.inputFormatters,
    this.maxLength,
    this.isRequired,
  });
  final Color? borderColor;
  final String? hint;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onEditingComplete;
  final bool? enabled;
  final TextInputAction? textInputAction;
  final Color? fillColor;
  final int? minLine;
  final int? maxLine;
  final int? maxLength;
  final TextInputType? keyboardType;
  final bool? autocorrect;
  final bool? autofocus;
  final String? Function(String?)? validator;
  final bool clear;
  final double? contentPaddingLeft;
  final double? contentPaddingRight;
  final double? borderRadius;
  final String? labelText;
  final TextStyle labelTextStyle;
  final Widget? labelIcon;
  final List<TextInputFormatter>? inputFormatters;
  final bool? isRequired;

  @override
  Widget build(BuildContext context) {
    return VStack(
      [
        if (labelText != null) ...[
          HStack(
            [
              labelText!.text.caption(context).textStyle(labelTextStyle).make(),
              if (isRequired == true) ...[
                ' *'.text.color(Colors.red).make(),
              ],
              Spacer(),
              labelIcon ?? 0.heightBox,
            ],
          ).pOnly(bottom: 12),
        ],
        ExBaseTextField(
          borderType: ExTextFieldBorderType.roundLine,
          borderRadius: borderRadius,
          borderColor: borderColor,
          minLine: minLine,
          maxLine: maxLine,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          onChanged: onChanged,
          autocorrect: autocorrect ?? true,
          autofocus: autofocus ?? false,
          onSubmitted: onSubmitted,
          onEditingComplete: onEditingComplete,
          hint: hint,
          clear: clear,
          enabled: enabled ?? true,
          contentPaddingLeft: contentPaddingLeft,
          contentPaddingRight: contentPaddingRight,
          contentPaddingTop: 8,
          controller: controller,
          fillColor: fillColor,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: validator,
          inputFormatters: inputFormatters,
          maxLength: maxLength,
        ),
      ],
    );
  }
}
