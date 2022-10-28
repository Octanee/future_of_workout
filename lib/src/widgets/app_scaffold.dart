import 'package:flutter/material.dart';

import 'package:future_of_workout/src/styles/styles.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    required this.body,
    this.title,
    this.actions,
    this.leading = const AppIcon(iconData: AppIcons.left),
    this.floatingActionButton,
    super.key,
  });

  final String? title;
  final Widget? body;
  final List<Widget>? actions;
  final Widget? leading;
  final Widget? floatingActionButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: floatingActionButton,
      appBar: _getAppBar(context),
      backgroundColor: AppColors.background,
      body: body,
    );
  }

  AppBar? _getAppBar(BuildContext context) {
    if (title?.isNotEmpty ?? false) {
      return AppBar(
        actions: actions,
        leading: leading != null
            ? IconButton(
                onPressed: () => Navigator.of(context).maybePop(),
                icon: leading!,
              )
            : null,
        iconTheme: const IconThemeData(color: AppColors.grey),
        elevation: 1,
        backgroundColor: AppColors.white,
        title: Text(
          title ?? '',
          style: AppTextStyle.bold28,
        ),
        centerTitle: true,
      );
    }
    return null;
  }
}
