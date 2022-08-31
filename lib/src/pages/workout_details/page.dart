import 'package:flutter/material.dart';

import '../../models/models.dart';
import '../../various/various.dart';
import 'screen.dart';

class WorkoutDetailsPage extends StatelessWidget {
  final Workout _workout;

  const WorkoutDetailsPage({required Workout workout, Key? key})
      : _workout = workout,
        super(key: key);

  static Route<void> route({required Workout workout}) => AppPageRoute(
        child: WorkoutDetailsPage(
          workout: workout,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return WorkoutDetailsScreen();
  }
}
