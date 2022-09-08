import 'package:flutter/material.dart';

import 'package:future_of_workout/src/presentation/styles/styles.dart';
import 'package:future_of_workout/src/presentation/widgets/floating_action_button.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    this.title,
    this.body,
    this.actions,
    this.leading,
    this.hasAppBar = true,
    this.hasFloatingActionButton = false,
    this.onPressedFloatingActionButton,
    this.floatingActionButtonIcon,
    super.key,
  })  : assert(
          hasFloatingActionButton == true &&
              onPressedFloatingActionButton == null,
          'FloatingActionButton must have a "onPressed" function.',
        ),
        assert(
          hasFloatingActionButton == true && floatingActionButtonIcon == null,
          'FloatingActionButton must have a "floatingActionButtonIcon".',
        );

  final String? title;
  final Widget? body;
  final List<Widget>? actions;
  final Widget? leading;
  final bool hasAppBar;
  final bool hasFloatingActionButton;
  final void Function()? onPressedFloatingActionButton;
  final IconData? floatingActionButtonIcon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: _getFab(),
      appBar: _getAppBar(),
      backgroundColor: AppColors.background,
      body: body,
    );
  }

  Widget? _getFab() => hasFloatingActionButton
      ? AppFloatingActionButton(
          floatingActionButtonIcon: floatingActionButtonIcon,
          onPressedFloatingActionButton: onPressedFloatingActionButton,
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
