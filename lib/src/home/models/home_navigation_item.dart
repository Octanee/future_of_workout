import 'package:flutter/material.dart';
import 'package:future_of_workout/src/body/body/body_screen.dart';
import 'package:future_of_workout/src/current_workout/current_workout.dart';
import 'package:future_of_workout/src/settings/view/settings_page.dart';
import 'package:future_of_workout/src/widgets/app_icon.dart';
import 'package:future_of_workout/src/workout/workouts/workouts.dart';

enum HomeNavigationItem {
  currentWorkout(
    icon: AppIcons.play,
    view: CurrentWorkoutPage(),
    label: 'Workout',
  ),
  workouts(
    icon: AppIcons.list,
    view: WorkoutsPage(),
    label: 'Plans',
  ),
  body(
    icon: AppIcons.muscle,
    view: BodyPage(),
    label: 'Body',
  ),

  settings(
    icon: AppIcons.settings,
    view: SettingsPage(),
    label: 'Settings',
  );

  const HomeNavigationItem({
    required this.icon,
    required this.view,
    required this.label,
  });

  final Widget view;
  final AppIcons icon;
  final String label;
}
