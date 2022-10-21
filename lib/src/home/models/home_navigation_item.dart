import 'package:flutter/material.dart';
import 'package:future_of_workout/src/body/body/body_screen.dart';
import 'package:future_of_workout/src/current_workout/current_workout.dart';
import 'package:future_of_workout/src/settings/view/settings_page.dart';
import 'package:future_of_workout/src/workout/workouts/workouts.dart';

enum HomeNavigationItem {
  currentWorkout(
    icon: Icons.play_arrow,
    view: CurrentWorkoutPage(),
    label: 'Workout',
  ),
  workouts(
    icon: Icons.list_alt_rounded,
    view: WorkoutsPage(),
    label: 'Plans',
  ),
  body(
    icon: Icons.sports_gymnastics,
    view: BodyPage(),
    label: 'Body',
  ),

  settings(
    icon: Icons.settings,
    view: SettingsPage(),
    label: 'Settings',
  );

  const HomeNavigationItem({
    required this.icon,
    required this.view,
    required this.label,
  });

  final Widget view;
  final IconData icon;
  final String label;
}
