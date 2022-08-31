import 'package:flutter/material.dart';

import '../various/various.dart';

class AppScaffold extends StatelessWidget {
  final String? title;
  final Widget? body;
  final List<Widget>? actions;
  final Widget? leading;
  final bool hasAppBar;
  final bool hasFloatingActionButton;
  final void Function()? onPressedFloatingActionButton;
  final IconData? floatingActionButtonIcon;

  const AppScaffold({
    this.title,
    this.body,
    this.actions,
    this.leading,
    this.hasAppBar = true,
    this.hasFloatingActionButton = false,
    this.onPressedFloatingActionButton,
    this.floatingActionButtonIcon,
    Key? key,
  })  : assert(hasFloatingActionButton == true
            ? (onPressedFloatingActionButton != null &&
                floatingActionButtonIcon != null)
            : true),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _getFab(),
      appBar: _getAppBar(),
      backgroundColor: AppColors.background,
      body: body,
    );
  }

  Widget? _getFab() => hasFloatingActionButton
      ? FloatingActionButton(
          backgroundColor: AppColors.yellow,
          onPressed: onPressedFloatingActionButton,
          child: Icon(
            floatingActionButtonIcon,
            size: 32,
            color: AppColors.grey,
          ),
        )
      : null;

  AppBar? _getAppBar() => hasAppBar
      ? AppBar(
          actions: actions,
          leading: leading,
          iconTheme: const IconThemeData(color: AppColors.grey),
          elevation: 1,
          backgroundColor: AppColors.white,
          title: Text(
            title ?? '',
            style: AppTextStyle.bold28,
          ),
          centerTitle: true,
        )
      : null;
}
