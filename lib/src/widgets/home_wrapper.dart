import 'dart:math' as math;
import 'package:flutter/material.dart';

class HomeWrapper extends StatefulWidget {
  const HomeWrapper({
    required this.body,
    this.floatingActionButton,
    super.key,
  });

  final Widget body;
  final Widget? floatingActionButton;

  @override
  State<HomeWrapper> createState() => _HomeWrapperState();
}

class _HomeWrapperState extends State<HomeWrapper>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    )..forward();
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.fastOutSlowIn,
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          widget.body,
          if (widget.floatingActionButton != null) getFloatingActionButton(),
        ],
      ),
    );
  }

  Widget getFloatingActionButton() {
    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Transform.rotate(
              angle: (1.0 + _controller.value) * math.pi,
              child: child,
            );
          },
          child: ScaleTransition(
            scale: _animation,
            child: widget.floatingActionButton,
          ),
        ),
      ),
    );
  }
}
