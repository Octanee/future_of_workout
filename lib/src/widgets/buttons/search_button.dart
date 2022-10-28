import 'package:flutter/material.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({this.text = 'Search', this.onTap, super.key});

  final String text;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return BarButton(
      text: text,
      icon: const AppIcon(iconData: AppIcons.search),
      onTap: onTap,
    );
  }
}
