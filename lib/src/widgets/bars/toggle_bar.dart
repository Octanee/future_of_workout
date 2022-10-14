import 'package:flutter/material.dart';
import 'package:future_of_workout/src/widgets/bars/custom_tab_bar.dart';

class ToggleBar extends StatefulWidget {
  ToggleBar({
    required this.onChange,
    required this.tabs,
    this.initialIndex = 0,
    super.key,
  }) : assert(tabs.isNotEmpty, 'Tabs cannot be empty');

  final List<Tab> tabs;
  final void Function(int index) onChange;
  final int initialIndex;

  @override
  State<ToggleBar> createState() => _ToggleBarState();
}

class _ToggleBarState extends State<ToggleBar> with TickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    controller = TabController(
      length: widget.tabs.length,
      vsync: this,
      initialIndex: widget.initialIndex,
    )..addListener(() {
        widget.onChange(controller.index);
      });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomTabBar(
      controller: controller,
      tabs: widget.tabs,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
