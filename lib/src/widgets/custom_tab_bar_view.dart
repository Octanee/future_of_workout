import 'package:flutter/material.dart';

class CustomTabBarView extends StatelessWidget {
  const CustomTabBarView({
    required this.children,
    super.key,
  });

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TabBarView(
        physics: const BouncingScrollPhysics(),
        children: children,
      ),
    );
  }
}
