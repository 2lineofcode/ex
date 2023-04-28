import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

import 'ex_textfield_base.dart';

///   created               : Aditya Pratama
///   originalFilename      : ex_text_field_icon
///   date                  : 24 Jun 2021
///   —————————————————————————————————————————————————————————————————————————————
///   <img width="349" alt="image" src="https://user-images.githubusercontent.com/36602270/169626756-7bbcb4f5-f819-4e4b-bd26-fc54c5894ce4.png">

class ExTextField extends StatelessWidget {
  const ExTextField({
    Key? key,
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
    this.borderColor = Vx.neutral200,
    this.prefixIcon,
    this.suffixIcon,
    this.height = 40,
    this.icon,
    this.borderRadius = 4,
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
    this.labelStyle,
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
  }) : super(key: key);

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
  final Widget? icon;
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

  @override
  Widget build(BuildContext context) {
    return VStack(
      [
        ExBaseTextField(
          borderType: ExTextFieldBorderType.roundLine,
          borderRadius: borderRadius,
          borderColor: borderColor,
          prefixIcon: prefixIcon != null
              ? HStack([
                  16.widthBox,
                  prefixIcon!,
                  12.widthBox,
                  Container(color: borderColor, height: 40, width: 1),
                  16.widthBox,
                ])
              : null,
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
          style: style,
          enableSuggestions: enableSuggestions,
          key: key,
          contentPaddingTop: contentPaddingTop,
          maxLength: maxLength,
        ),
      ],
    );
  }
}
