import 'package:flutter/material.dart';
import 'package:future_of_workout/src/body/body/body_screen.dart';
import 'package:future_of_workout/src/current_workout/current_workout.dart';
import 'package:future_of_workout/src/discover/discover_screen.dart';
import 'package:future_of_workout/src/settings/settings_screen.dart';
import 'package:future_of_workout/src/workout/workouts/workouts.dart';

enum HomeNavigationItem {
  workouts(
    icon: Icon(Icons.list_alt_rounded),
    itemIndex: 0,
    view: WorkoutsPage(),
    label: 'Plans',
  ),
  body(
    icon: Icon(Icons.sports_gymnastics),
    itemIndex: 1,
    view: BodyPage(),
    label: 'Body',
  ),
  currentWorkout(
    icon: Icon(Icons.play_arrow),
    itemIndex: 2,
    view: CurrentWorkoutPage(),
    label: 'Workout',
  ),
  discover(
    icon: Icon(Icons.search),
    itemIndex: 3,
    view: DiscoverScreen(),
    label: 'Discover',
  ),
  settings(
    icon: Icon(Icons.settings),
    itemIndex: 4,
    view: SettingsScreen(),
    label: 'Settings',
  );

  const HomeNavigationItem({
    required this.icon,
    required this.itemIndex,
    required this.view,
    required this.label,
  });

  final int itemIndex;
  final Widget view;
  final Icon icon;
  final String label;

  NavigationDestination getNavigationDestination() {
    return NavigationDestination(
      icon: icon,
      label: label,
    );
  }
}
