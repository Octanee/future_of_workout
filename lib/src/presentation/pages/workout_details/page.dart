import 'package:flutter/material.dart';

import '../../../data/models/models.dart';
import '../../router/router.dart';
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
