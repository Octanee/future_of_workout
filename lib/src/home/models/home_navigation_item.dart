import 'package:flutter/material.dart';
import 'package:future_of_workout/src/body/body/body_screen.dart';
import 'package:future_of_workout/src/current_workout/current_workout.dart';
import 'package:future_of_workout/src/settings/view/settings_page.dart';
import 'package:future_of_workout/src/widgets/app_icon.dart';
import 'package:future_of_workout/src/workout/workouts/workouts.dart';
import 'package:future_of_workout/src/workout_goals/workout_goals.dart';

enum HomeNavigationItem {
  currentWorkout(
    icon: AppIcons.play,
    view: CurrentWorkoutPage(),
    label: 'workout',
  ),
  workouts(
    icon: AppIcons.list,
    view: WorkoutsPage(),
    label: 'plans',
  ),
  goals(
    icon: AppIcons.stats,
    view: WorkoutGoalsTab(),
    label: 'progress',
  ),
  body(
    icon: AppIcons.muscle,
    view: BodyPage(),
    label: 'body',
  ),
  settings(
    icon: AppIcons.settings,
    view: SettingsPage(),
    label: 'settings',
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
