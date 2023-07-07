import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

import 'ex_textfield_base.dart';

///   created               : Aditya Pratama
///   originalFilename      : ex_text_field_normal
///   date                  : 24 Jun 2021
///   —————————————————————————————————————————————————————————————————————————————
///   <img width="339" alt="image" src="https://user-images.githubusercontent.com/36602270/169626802-e1cd3866-814d-4b27-87ff-488d80c2fd0a.png">

class ExTextField extends StatelessWidget {
  const ExTextField({
    super.key,
    this.controller,
    this.hint,
    this.value,
    this.clear = true,
    this.isPassword = false,
    this.obscureText = false,
    this.borderType = ExTextFieldBorderType.underLine,
    this.maxLine = 1,
    this.maxLength,
    this.textAlign = TextAlign.left,
    this.fillColor = Colors.transparent,
    this.borderColor = const Color(0xFFC7CBCF),
    this.prefixIcon,
    this.suffixIcon,
    this.height = 40,
    this.borderRadius = 12,
    this.contentPaddingLeft,
    this.contentPaddingTop,
    this.keyboardType,
    this.textInputAction,
    this.inputFormatters,
    this.onChanged,
    this.onSubmitted,
    this.onEditingComplete,
    this.focusNode,
    this.counterText,
    this.autofocus = false,
    this.style,
    this.labelText,
    this.labelStyle = const TextStyle(fontSize: 14),
    this.helperText,
    this.helperStyle = const TextStyle(fontSize: 12),
    this.cursorColor,
    this.autocorrect = true,
    this.cursorHeight,
    this.cursorRadius,
    this.cursorWidth = 2.0,
    this.enableSuggestions = true,
    this.enabled,
    this.showCursor,
    this.onSaved,
    this.validator,
    this.autovalidateMode,
    this.borderColorFocus,
    this.initialValue,
    this.readOnly,
    this.isRequired,
    this.clearCallback,
  });

  final TextEditingController? controller;
  final String? hint;
  final String? value;
  final bool clear;
  final bool isPassword;
  final bool obscureText;
  final ExTextFieldBorderType borderType;
  final int? maxLine;
  final int? maxLength;
  final TextAlign textAlign;
  final Color? fillColor;
  final Color? borderColor;
  final Color? borderColorFocus;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final double height;
  final double? borderRadius;
  final double? contentPaddingLeft;
  final double? contentPaddingTop;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onEditingComplete;
  final FocusNode? focusNode;
  final String? counterText;
  final bool autofocus;
  final TextStyle? style;
  final String? labelText;
  final TextStyle? labelStyle;
  final String? helperText;
  final TextStyle? helperStyle;
  final Color? cursorColor;
  final bool autocorrect;
  final double? cursorHeight;
  final double cursorWidth;
  final Radius? cursorRadius;
  final bool enableSuggestions;
  final bool? enabled;
  final bool? showCursor;
  final Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final AutovalidateMode? autovalidateMode;
  final String? initialValue;
  final bool? readOnly;
  final bool? isRequired;
  final Function? clearCallback;

  @override
  Widget build(BuildContext context) {
    return VStack(
      [
        if (labelText != null) ...[
          HStack(
            [
              labelText!.text.caption(context).textStyle(labelStyle).make(),
              if (isRequired == true) ...[
                ' *'.text.color(Colors.red).make(),
              ],
            ],
          ).pOnly(bottom: 8),
        ],
        ExBaseTextField(
          height: height,
          borderType: ExTextFieldBorderType.roundLine,
          borderRadius: borderRadius,
          borderColor: borderColor,
          prefixIcon: prefixIcon != null ? HStack([16.widthBox, prefixIcon!]) : null,
          contentPaddingLeft: prefixIcon != null ? 0 : 16,
          suffixIcon: suffixIcon,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          onChanged: onChanged,
          onSubmitted: onSubmitted,
          onEditingComplete: onEditingComplete,
          hint: hint,
          enabled: enabled ?? true,
          controller: controller,
          isPassword: isPassword,
          obscureText: obscureText,
          fillColor: fillColor,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: validator,
          borderColorFocus: Theme.of(context).primaryColor,
          autocorrect: autocorrect,
          autofocus: autofocus,
          clear: clear,
          initialValue: initialValue,
          focusNode: focusNode,
          readOnly: readOnly,
          inputFormatters: inputFormatters,
          counterText: counterText,
          onSaved: onSaved,
          textAlign: textAlign,
          value: value,
          style: TextStyle(color: Colors.black),
          enableSuggestions: enableSuggestions,
          key: key,
          contentPaddingTop: contentPaddingTop,
          maxLength: maxLength,
          clearCallback: clearCallback,
        ),
        if (helperText != null) helperText!.text.caption(context).textStyle(helperStyle).make().pOnly(top: 8),
      ],
    );
  }
}
