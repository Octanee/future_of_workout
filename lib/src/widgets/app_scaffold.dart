import 'package:flutter/material.dart';

import 'package:future_of_workout/src/styles/styles.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    this.title,
    this.body,
    this.actions,
    this.leading,
    this.floatingActionButton,
    this.hasAppBar = true,
    super.key,
  });

  final String? title;
  final Widget? body;
  final List<Widget>? actions;
  final Widget? leading;
  final bool hasAppBar;
  final Widget? floatingActionButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: floatingActionButton,
      appBar: _getAppBar(),
      backgroundColor: AppColors.background,
      body: body,
    );
  }

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
