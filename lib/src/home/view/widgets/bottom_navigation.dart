import 'package:flutter/material.dart';
import 'package:future_of_workout/src/home/home.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 2,
      shape: const CircularNotchedRectangle(),
      child: Row(
        children: [
          const Flexible(fit: FlexFit.tight, child: SizedBox()),
          NavigationItem(
            item: HomeNavigationItem.workouts,
          ),
          NavigationItem(
            item: HomeNavigationItem.body,
          ),
          NavigationItem(
            item: HomeNavigationItem.settings,
          ),
        ],
      ),
    );
  }
}
