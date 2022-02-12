import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'ex_textfield.dart';

///   created               : Aditya Pratama
///   originalFilename      : ex_text_field_normal
///   date                  : 24 Jun 2021
///   —————————————————————————————————————————————————————————————————————————————
///   screenshot            : https://prnt.sc/16r3q1c

class ExTextFieldNormal extends StatelessWidget {
  const ExTextFieldNormal({
    Key? key,
    this.borderColor = const Color(0xFFe4e8eb),
    this.hint,
    this.controller,
    this.isPassword,
    this.obscureText,
    this.onChanged,
    this.onSubmitted,
    this.onEditingComplete,
    this.enabled,
    this.fillColor = Colors.transparent,
    this.textInputType,
    this.textInputAction,
    this.validator,
    this.borderColorFocus,
  }) : super(key: key);
  final Color? borderColor;
  final Color? borderColorFocus;
  final String? hint;
  final TextEditingController? controller;
  final bool? isPassword;
  final bool? obscureText;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onEditingComplete;
  final bool? enabled;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final Color? fillColor;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return ExTextField(
      borderType: ExTextFieldBorderType.roundLine,
      borderRadius: 8,
      borderColor: borderColor,
      keyboardType: textInputType,
      textInputAction: textInputAction,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      onEditingComplete: onEditingComplete,
      hint: hint,
      enabled: enabled ?? true,
      controller: controller,
      isPassword: isPassword ?? false,
      obscureText: obscureText ?? false,
      fillColor: fillColor,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      showCursor: true,
      borderColorFocus: Theme.of(context).primaryColor,
    );
  }
}
