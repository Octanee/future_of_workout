part of 'app_router.dart';

class AppTransitions {
  AppTransitions({
    this.transition = AppPageRouteTransition.slide,
    this.direction = AxisDirection.up,
    this.duration = const Duration(milliseconds: 300),
  });

  final AppPageRouteTransition transition;
  final AxisDirection direction;
  final Duration duration;

  Widget buildTransitions(
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    switch (transition) {
      case AppPageRouteTransition.scale:
        return ScaleTransition(
          scale: animation,
          child: child,
        );
      case AppPageRouteTransition.slide:
        return SlideTransition(
          position: Tween<Offset>(
            begin: _getBeginOffset(),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );
    }
  }

  Offset _getBeginOffset() {
    switch (direction) {
      case AxisDirection.up:
        return const Offset(0, 1);
      case AxisDirection.right:
        return const Offset(-1, 0);
      case AxisDirection.down:
        return const Offset(0, -1);
      case AxisDirection.left:
        return const Offset(1, 0);
    }
  }
}

enum AppPageRouteTransition {
  scale,
  slide,
}
