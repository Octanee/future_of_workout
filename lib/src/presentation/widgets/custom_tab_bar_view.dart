import 'package:flutter/material.dart';

class CustomTabBarView extends StatelessWidget {
  const CustomTabBarView({
    required this.children,
    this.height = 572,
    Key? key,
  }) : super(key: key);

  final List<Widget> children;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: TabBarView(
        physics: const BouncingScrollPhysics(),
        children: children,
      ),
    );
  }
}
