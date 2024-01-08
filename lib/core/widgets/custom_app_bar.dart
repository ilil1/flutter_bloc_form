import 'package:flutter/material.dart';
import '../core.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title = '',
    this.actions = const [],
    this.bottom,
    this.color,
    this.textStyle,
  }) : super();

  final String title;
  final List<Widget> actions;
  final PreferredSizeWidget? bottom;
  final Color? color;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      bottom: bottom,
      elevation: 0,
      leadingWidth: 64,
      title: Text(title, style: textStyle ?? context.textTheme.krPoint1),
      actions: actions,
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
