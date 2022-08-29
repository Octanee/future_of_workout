import 'package:flutter/material.dart';

class CustomTabBarView extends StatelessWidget {
  const CustomTabBarView({
    required this.children,
    Key? key,
  }) : super(key: key);

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 572,
      child: TabBarView(
        physics: const BouncingScrollPhysics(),
        children: children,
      ),
    );
  }
}
