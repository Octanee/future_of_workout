import 'package:flutter/material.dart';
import 'package:future_of_workout/src/body/body_screen.dart';
import 'package:future_of_workout/src/discover/discover_screen.dart';
import 'package:future_of_workout/src/settings/settings_screen.dart';
import 'package:future_of_workout/src/workouts/workouts.dart';

enum HomeNavigationItem {
  workouts(
    icon: Icon(Icons.home),
    itemIndex: 0,
    view: WorkoutsScreen(),
  ),
  body(
    icon: Icon(Icons.sports_gymnastics),
    itemIndex: 1,
    view: BodyScreen(),
  ),
  discover(
    icon: Icon(Icons.search),
    itemIndex: 2,
    view: DiscoverScreen(),
  ),
  settings(
    icon: Icon(Icons.settings),
    itemIndex: 3,
    view: SettingsScreen(),
  );

  const HomeNavigationItem({
    required this.icon,
    required this.itemIndex,
    required this.view,
  });

  final int itemIndex;
  final Widget view;
  final Icon icon;

  NavigationDestination getNavigationDestination() {
    return NavigationDestination(
      icon: icon,
      label: name,
    );
  }
}
