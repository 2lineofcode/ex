import 'package:ex/ex.dart';
import 'package:flutter/material.dart';

class ExAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ExAppBar({
    required this.title,
    this.leading,
    this.actions,
    this.textStyle,
    super.key,
  });

  final String title;
  final TextStyle? textStyle;
  final Widget? leading;
  final List<Widget>? actions;

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: '$title'.text.bold.size(16).maxLines(1).ellipsis.textStyle(textStyle).make(),
      actions: actions,
      leading: leading ?? ExBackButton(),
      // Add any other desired customization to the AppBar
    );
  }
}
